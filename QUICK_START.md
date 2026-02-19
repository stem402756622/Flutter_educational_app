# Quick Start Guide - Adventure Grammar Game

## 🚀 Getting Started in 5 Minutes

### Prerequisites
- Flutter SDK installed
- Device or emulator ready
- Terminal/Command Prompt

### Step 1: Install Dependencies
```bash
cd C:\Users\Cym\Desktop\ther
flutter pub get
```

### Step 2: Run the App
```bash
flutter run
```

The app will compile and launch on your device/emulator.

## 📱 What You'll See

### Main Menu (First Screen)
- Large book icon with scale animation
- "Welcome to Grammar Adventure" title
- 4 buttons:
  - ⭐ Level 1: Easy
  - 🧮 Level 2: Average
  - ✏️ Level 3: Difficult
  - 🏆 Scoreboard

### Clicking Any Level

You'll navigate to that level's **Customization Screen**.

Example (Level 1):
1. **Instructions Card** at top with info icon
2. **Question Cards** below (starts with 1)
3. **Sentence Input** - Type a sentence (e.g., "The cat is black.")
4. **Word Input** - Type the word to identify (e.g., "cat")
5. **Part of Speech Dropdown** - Select: Noun, Pronoun, or Adjective
6. **Add Another Question** button - Adds another question set
7. **Delete Button** (trash icon on cards) - Remove questions
8. **Proceed to Level 2** - Goes to next customization screen

### Level 2 Customization

Same structure but:
- **Math Problem** - "2+3", "10-4", etc.
- **Answer** - The correct result
- **Word Link** - Words from Level 1
- **Proceed to Level 3** button

### Level 3 Customization

- **Fill-in-Blank Sentence** - "The ___ is big."
- **Answer** - The word that fills the blank
- **Finish Setup & Play** button
- Shows success dialog when done

## 🎮 Interactive Features

### Hover Effects
- Move mouse over buttons → They highlight
- Click options → They get orange border
- Hover over icons → Cursor changes to pointer

### Animations
- Cards **scale in** when you open a screen
- Buttons **fade in** smoothly
- Navigation has **slide + fade** effect
- Options **animate** when selected

### Input Validation
- Can't proceed with empty fields
- Will show error message
- Must fill sentence, word, and part of speech
- Dropdown prevents invalid selections

## 🎨 Visual Guide

### Colors
- **Brown** (#6D4C41) - Main theme, adventure feel
- **Orange** (#FF9800) - Buttons, highlights, selections
- **Green** (Level 1) - Relaxing, learning focused
- **Blue** (Level 2) - Focus, math concentration
- **Purple** (Level 3) - Challenge, thinking

### Icons
- 📚 Book - Nouns
- 👤 Person - Pronouns
- 🎨 Palette - Adjectives
- ➕ Calculate - Math problems
- ✏️ Edit - Fill-in-the-blank
- 🔗 Link - Word connections

## 💡 Pro Tips

1. **Add Multiple Questions**
   - Click "Add Another Question" multiple times
   - Great for creating variety

2. **Test Validation**
   - Try clicking "Proceed" with empty fields
   - You'll see error message

3. **Observe Animations**
   - Watch cards slide in from the right
   - Notice smooth fades between screens
   - See scale effect on buttons

4. **Explore Hover States**
   - Hover over buttons (they get bigger)
   - Click options (they highlight orange)
   - Hover over delete icon (goes red)

## 📊 Data Flow During Session

```
Level 1 Questions
    ↓
  GameData (Provider)
    ↓
Level 2 Questions
    ↓
  GameData (Provider)
    ↓
Level 3 Questions
    ↓
  GameData (Provider)
    ↓
Ready for Gameplay
```

All custom questions are stored in GameData and can be accessed by gameplay screens.

## ⚙️ Troubleshooting

### App Won't Run
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

### Seeing Errors in Console
Most are **INFO** or **warnings** - Safe to ignore. Critical **errors** would prevent running.

### Animations Laggy
- Try on physical device (emulator can be slower)
- Close other apps
- Run in Release mode: `flutter run --release`

### Can't Navigate Back
- The app currently goes forward through levels
- After Level 3, "Setup Complete" dialog returns you to Menu

## 📲 Testing Checklist

Use this to verify everything works:

- [ ] App launches and shows menu
- [ ] Book icon animates (scales in)
- [ ] Text slides in from left
- [ ] Button click navigates with animation
- [ ] Level 1 screen shows instruction card
- [ ] Can type in all text fields
- [ ] Can select from dropdown
- [ ] Add Question button works (adds new card)
- [ ] Delete button appears on cards > 1
- [ ] Trying to proceed with empty fields shows error
- [ ] Filling all fields and clicking Proceed navigates
- [ ] Level 2 shows math and word fields
- [ ] Level 3 shows fill-in-blank fields
- [ ] Final "Finish Setup" shows success dialog
- [ ] Success dialog returns to Menu
- [ ] Scoreboard button navigates to scoreboard page
- [ ] All transitions have fade + slide effect
- [ ] No console errors (only warnings OK)

## 🔄 Next Steps

After customizing questions, the next phase would be:

1. **Gameplay Implementation**
   - Actually play levels with custom questions
   - Track scores
   - Validate answers

2. **Persistent Storage**
   - Save questions to device
   - Load previous questions
   - Create question sets

3. **Advanced Features**
   - Leaderboards
   - Sound effects
   - Visual effects for rewards
   - Difficulty progression

## 📚 Documentation Files

In the `ther` folder, check:
- **FEATURES_SUMMARY.md** - What was added
- **IMPLEMENTATION_GUIDE.md** - Detailed feature docs
- **ARCHITECTURE.md** - Technical structure

## 🆘 Need Help?

1. Check the documentation files
2. Look at the code comments
3. Run `flutter doctor` to check environment
4. Check console output for specific errors

---

**Ready to explore? Start with `flutter run`!** 🚀
