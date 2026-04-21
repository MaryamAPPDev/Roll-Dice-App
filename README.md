# Dice Roller App 🎲

A fun and interactive dice rolling application built with Flutter. This project demonstrates fundamental Flutter concepts including stateful widgets, animations, and modern UI design.

## About This Project

I created this dice roller app as one of my first Flutter projects to practice:
- Working with StatefulWidget for managing state
- Implementing smooth animations with AnimationController
- Building responsive and interactive UI
- Using Flutter's Material Design components
- Managing random number generation
- Creating engaging user experiences

## Features

### Interactive Dice Rolling
- Tap the button to roll a virtual dice
- Random number generation (1-6)
- Smooth rolling animation with rotation and scale effects
- Visual feedback during rolling

### Roll Tracking
- Counter displays total number of rolls
- Shows current dice result
- Roll history tracking

### Modern UI Design
- Beautiful gradient background
- Smooth animations and transitions
- Material Design 3 components
- Clean and intuitive interface
- Responsive layout

### Visual Elements
- Animated dice with scale and rotation effects
- Pulse animation during rolling
- Disabled state when dice is already rolling
- Professional button design with elevation

## Tech Stack

- **Flutter & Dart** - Cross-platform mobile framework
- **Material Design 3** - Modern UI components
- **Animations** - AnimationController with Tween animations
- **Random** - Dart's Random class for dice simulation

## Key Concepts Demonstrated

### 1. State Management
Using StatefulWidget to manage:
- Current dice value
- Total roll count
- Rolling state (enabled/disabled)
- Animation states

### 2. Animations
Implemented multiple coordinated animations:
- Scale animation (grow and shrink)
- Rotation animation (360° spin)
- Tween sequences for smooth transitions
- AnimationController lifecycle management

### 3. Async Operations
- Delayed state updates for rolling effect
- Sequential animation steps
- Preventing multiple simultaneous rolls

### 4. UI Composition
- Reusable widget structure
- Gradient backgrounds
- Layered design with depth
- Responsive padding and spacing

## Project Structure

    lib/
    ├── main.dart                 # App entry point
    ├── gradient_container.dart   # Main screen layout with gradient
    ├── dice_roller.dart          # Dice logic and animations
    └── styled_text.dart          # Reusable text component (optional)
    
    assets/
    ├── dice-1.png               # Dice face images
    ├── dice-2.png
    ├── dice-3.png
    ├── dice-4.png
    ├── dice-5.png
    └── dice-6.png

## How It Works

### Random Number Generation
    final randomizer = Random();
    currentDiceRoll = randomizer.nextInt(6) + 1;  // Generates 1-6

### Animation Setup
    AnimationController with duration of 400ms
    TweenSequence for scale effect (1.0 → 1.3 → 1.0)
    Rotation from 0 to 2π radians (full circle)

### Rolling Process
1. User taps "Roll Dice" button
2. Button disables to prevent double-rolling
3. Animation controller starts
4. Dice rapidly changes values (8 times)
5. Final random value is set
6. Animation completes
7. Counter increments
8. Button re-enables

## Screenshots

<p align="center">
  <img src="screenshots/initial_state.png" width="200" alt="Initial State" />
  <img src="screenshots/rolling_animation.png" width="200" alt="Rolling" />
  <img src="screenshots/result_display.png" width="200" alt="Result" />
</p>

### 1. Initial State
Welcome screen with centered dice ready to roll. Shows app title and instructions.

### 2. Rolling Animation
Dice in motion with rotation and scale effects. Button shows "Rolling..." state.

### 3. Result Display
Final result shown with roll count. Button ready for next roll.

## What I Learned

### Flutter Fundamentals
- StatefulWidget vs StatelessWidget
- Widget lifecycle methods (initState, dispose)
- Building widget trees
- Using const constructors for performance

### Animation System
- AnimationController basics
- Tween and TweenSequence
- CurvedAnimation for natural motion
- AnimatedBuilder for efficient rebuilds
- Proper animation disposal

### State Management
- setState() for local state updates
- Preventing race conditions with flags
- Async state updates with Future.delayed
- Managing multiple related states

### UI/UX Design
- Creating visual hierarchy
- Adding depth with shadows and elevation
- Providing user feedback (disabled states)
- Smooth and natural animations

## Setup Instructions

### Prerequisites
- Flutter SDK 3.x
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone the repository

       git clone [your-repo-url]
       cd dice-roller-app

2. Install dependencies

       flutter pub get

3. Add dice images to assets folder

       assets/
       ├── dice-1.png
       ├── dice-2.png
       ├── dice-3.png
       ├── dice-4.png
       ├── dice-5.png
       └── dice-6.png

4. Update pubspec.yaml

       flutter:
         assets:
           - assets/

5. Run the app

       flutter run

## Future Enhancements

Ideas for expanding this project:
- [ ] Add multiple dice rolling (2 dice, 3 dice)
- [ ] Include dice roll statistics (most common number)
- [ ] Add sound effects for rolling
- [ ] Implement shake-to-roll gesture
- [ ] Save roll history with timestamps
- [ ] Different dice types (d4, d8, d10, d20 for RPG games)
- [ ] Customizable dice colors/themes
- [ ] Share results feature

## Code Highlights

### Animation Controller Setup
    _controller = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );
    
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.3),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.3, end: 1.0),
        weight: 50,
      ),
    ]).animate(_controller);

