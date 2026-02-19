#!/usr/bin/env bash
# Adventure Grammar Game - Quick Start Script
# Usage: Run from project root to get started quickly

echo "🎮 Adventure Grammar Game - Setup & Run"
echo "======================================="
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter not found. Please install Flutter first."
    exit 1
fi

echo "✅ Flutter found!"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
flutter pub get
echo "✅ Dependencies installed!"
echo ""

# Run the app
echo "🚀 Launching Adventure Grammar Game..."
echo ""
echo "📱 What to expect:"
echo "   1. Main menu with animated welcome"
echo "   2. Click a level to customize questions"
echo "   3. Add sentences, math problems, or fill-in-blanks"
echo "   4. Proceed through levels"
echo "   5. Success dialog when setup is complete"
echo ""
echo "💡 Tip: Check the documentation files for detailed guides!"
echo ""

flutter run
