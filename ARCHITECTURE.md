# Architecture and Structure

## Application Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                         MyApp (main.dart)                    │
│                     (Provider Setup)                         │
└─────────────────────────┬───────────────────────────────────┘
                          │
                    ┌─────▼──────┐
                    │  GameData   │
                    │  (Provider) │
                    └─────┬──────┘
                          │
        ┌─────────────────┼──────────────────┐
        │                 │                  │
        ▼                 ▼                  ▼
  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐
  │ MenuScreen   │ │ Level Screens │ │ Customize    │
  │              │ │              │ │ Screens      │
  └──────────────┘ └──────────────┘ └──────────────┘
```

## Data Flow

```
User Actions → Customization Screens → GameData (Provider) → Gameplay Screens
    │                   │                     │                    │
    │          (Add/Edit/Remove)           (Store)          (Retrieve)
    │             Questions               Questions          Questions
    └───────────────────────────────────────────────────────────────┘
              Persistent State During Session
```

## Widget Hierarchy

```
MyApp
├── MultiProvider
│   └── MaterialApp
│       ├── MenuScreen (Root)
│       │   ├── AppBar
│       │   │   ├── Icon
│       │   │   └── Text
│       │   └── Body
│       │       ├── ScaleTransition (Icon)
│       │       ├── SlideTransition (Title)
│       │       └── ButtonGrid
│       │           ├── _buildHoverButton × 4
│       │           │   └── ElevatedButton.icon
│       │           └── ElevatedButton
│       │
│       ├── Level1CustomizeScreen
│       │   ├── AppBar
│       │   └── ListView
│       │       ├── InfoCard
│       │       ├── QuestionCards (List)
│       │       │   ├── TextField (Sentence)
│       │       │   ├── TextField (Word)
│       │       │   └── DropdownButton
│       │       ├── AddButton
│       │       └── ProceedButton
│       │
│       ├── Level2CustomizeScreen
│       │   └── Similar structure to Level1
│       │
│       ├── Level3CustomizeScreen
│       │   └── Similar structure to Level1
│       │
│       ├── Level1Screen (Gameplay)
│       │   ├── AppBar (with Score Chip)
│       │   └── Padding
│       │       ├── ScaleTransition (Card)
│       │       ├── RichText (Sentence)
│       │       ├── Options (3x)
│       │       │   └── AnimatedContainer
│       │       └── SubmitButton
│       │
│       ├── Level2Screen (Gameplay)
│       │   └── Similar to Level1
│       │
│       ├── Level3Screen (Gameplay)
│       │   └── Similar to Level1
│       │
│       └── ScoreboardScreen
│           └── Placeholder
```

## State Management Flow

```
GameData Instance
│
├── level1Questions: []
│   ├── Question 1: {sentence, word, answer}
│   ├── Question 2: {sentence, word, answer}
│   └── ...
│
├── level2Questions: []
│   ├── Question 1: {math, answer, word, pos}
│   ├── Question 2: {math, answer, word, pos}
│   └── ...
│
├── level3Questions: []
│   ├── Question 1: {sentence, answer}
│   ├── Question 2: {sentence, answer}
│   └── ...
│
└── Methods
    ├── addLevel1Question()
    ├── addLevel2Question()
    ├── addLevel3Question()
    ├── getQuestionsForLevel()
    └── clearAllData()
```

## Navigation Flow

```
START
  │
  ▼
MenuScreen (Scale + Slide animations)
  │
  ├─ Click Level 1 ──→ Level1CustomizeScreen
  │                         │
  │                         ▼
  │                  Add Questions
  │                  (Slide + Fade)
  │                         │
  │                         ▼
  │                  "Proceed to Level 2"
  │
  ├─ Click Level 2 ──→ Level2CustomizeScreen
  │                         │
  │                         ▼
  │                  Add Math Questions
  │                  (Slide + Fade)
  │                         │
  │                         ▼
  │                  "Proceed to Level 3"
  │
  ├─ Click Level 3 ──→ Level3CustomizeScreen
  │                         │
  │                         ▼
  │                  Add Fill-blank Questions
  │                  (Slide + Fade)
  │                         │
  │                         ▼
  │                  "Finish Setup & Play"
  │                         │
  │                         ▼
  │                  Success Dialog
  │                         │
  │                         ▼
  │                  Back to Menu
  │
  └─ Click Scoreboard ──→ ScoreboardScreen

Each transition: 500ms Fade + Slide
Each interaction: 300ms AnimatedContainer
```

## Animation Timeline

```
Screen Load Sequence:
0ms    - Screen builds
0ms    - FadeController.forward() starts
250ms  - ScaleController.forward() for icons
500ms  - SlideController.forward() for cards
800ms  - All animations complete

User Interaction:
0ms    - Option clicked
0ms    - AnimatedContainer.duration(300ms) triggers
300ms  - Border color and background change visible
       - Scale animation completes on correct answer
400-600ms - Bounce/Pulse effect (optional)
```

## File Dependencies

```
main.dart
├── models/game_data.dart
├── screens/menu_screen.dart
└── screens/
    ├── level1_customize_screen.dart
    │   └── screens/level2_customize_screen.dart
    │       └── screens/level3_customize_screen.dart
    │           └── screens/menu_screen.dart
    │
    ├── level1_screen.dart
    │   └── models/game_data.dart
    │
    ├── level2_screen.dart
    │   └── models/game_data.dart
    │
    ├── level3_screen.dart
    │   └── models/game_data.dart
    │
    └── scoreboard_screen.dart
```

## Animation Hierarchy

```
Screen Transition Animation
│
├─ FadeTransition (opacity: 0 → 1)
│
└─ SlideTransition (offset: (1, 0) → (0, 0))


Card Load Animation
│
└─ ScaleTransition (scale: 0 → 1)


Option Selection Animation
│
└─ AnimatedContainer
    ├─ Border color: grey → orange
    ├─ Background: transparent → orange[0.2]
    └─ Duration: 300ms


Success Feedback Animation
│
└─ ScaleTransition OR BounceTransition
    └─ Duration: 400-600ms
```

## Color Scheme Mapping

```
Primary: Colors.brown[800]  (#6D4C41) - Adventure theme
Accent:  Colors.orange       (#FF9800) - CTAs and highlights
Background: Colors.brown[50] (#EFEBE9) - Light neutral

Per-Level Gradients:
Level 1: Colors.green[100] → Colors.brown[100]
Level 2: Colors.blue[100] → Colors.brown[100]
Level 3: Colors.purple[100] → Colors.brown[100]

Interactive States:
Hover: elevation ↑, scale ↑
Selected: border color orange, background orange[0.2]
Success: green checkmark, scale animation
Error: red border, snackbar message
```

---

This architecture provides:
- **Scalability:** Easy to add new levels
- **Maintainability:** Clear separation of concerns
- **Reusability:** Shared components and patterns
- **Performance:** Efficient animations and state updates
