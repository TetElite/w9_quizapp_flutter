# W9 Quiz App - Implementation Complete 🎉

A Flutter quiz application implementing clean architecture with separate data, domain, and UI layers.

## 📁 Project Structure

```
lib/
├── data/
│   └── quiz_data.dart          # Mock quiz data repository
├── model/
│   └── quiz.dart              # Domain models (Quiz, Question, Choice, PlayerAnswer, QuizResult)
├── ui/
│   ├── quiz_app.dart          # Main app with state management and navigation
│   ├── screens/
│   │   ├── welcome_screen.dart    # Start screen
│   │   ├── question_screen.dart   # Question display and answer selection
│   │   └── result_screen.dart     # Results with score and detailed answers
│   └── widgets/
│       ├── app_button.dart            # Reusable button widget
│       ├── choice_button.dart         # Answer choice button
│       ├── question_identifier.dart   # Question number badge
│       └── result_item.dart           # Individual result display
└── main.dart                  # App entry point
```

## 🎯 Features Implemented

### Core Requirements (W9)
- ✅ Welcome/Start screen with quiz title
- ✅ Question screen with single-choice answers
- ✅ Answer selection and validation
- ✅ Question-by-question navigation
- ✅ Result screen showing:
  - Total score
  - Percentage
  - Detailed results per question
  - Correct/incorrect answers highlighted
- ✅ Restart quiz functionality

### Architecture
- ✅ Clean separation: DATA → DOMAIN → UI
- ✅ Stateful widget for state management (`QuizApp`)
- ✅ Navigation via enum-based screen state
- ✅ Reusable widgets for consistency
- ✅ Player answers stored in `QuizResult` model

## 🏗️ State Management

**QuizApp** manages all application state:
- `_currentScreen` - Current active screen (enum)
- `_currentQuestionIndex` - Tracks question progress
- `_playerAnswers` - Stores user selections
- `_quizResult` - Final quiz result

## 🎨 UI Components

### Screens
| Screen | Type | Responsibilities |
|--------|------|-----------------|
| WelcomeScreen | Stateless | Display quiz title, start button |
| QuestionScreen | Stateful | Show question, handle answer selection |
| ResultScreen | Stateless | Display score and detailed results |

### Reusable Widgets
| Widget | Type | Purpose |
|--------|------|---------|
| AppButton | Stateless | Styled action buttons |
| ChoiceButton | Stateless | Answer options with selection state |
| QuestionIdentifier | Stateless | Question number badge |
| ResultItem | Stateless | Individual question result display |

## 📊 Domain Models

- **Quiz**: Container for quiz metadata and questions
- **Question**: Question text, choices, and correct answer
- **Choice**: Individual answer option
- **PlayerAnswer**: User's selected answer with correctness
- **QuizResult**: Complete quiz attempt with score calculation

## 🚀 Running the App

```bash
# Get dependencies
flutter pub get

# Run on device/emulator
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze
```

## 📝 Answers to Reflection Questions

### Q2: Where do you keep player submission?
Player submissions are stored in:
- **During quiz**: `_playerAnswers` list in `_QuizAppState`
- **After completion**: `QuizResult` object containing all `PlayerAnswer` entries
- Displayed in `ResultScreen` by mapping answers to questions

### Q5: Navigation Management
Navigation is handled in `QuizApp._QuizAppState`:
- **Enum-based routing**: `AppScreen.welcome`, `.question`, `.result`
- **setState()** triggers screen transitions
- **Answer flow**: `_handleAnswerSelected()` → increment index or finish quiz
- **Question progression**: Via `_currentQuestionIndex`
- **Results transition**: `_finishQuiz()` creates `QuizResult` and switches to result screen

### Q4: Component Diagram
```
QuizApp (Stateful)
├── State: _currentScreen, _currentQuestionIndex, _playerAnswers, _quizResult
├── WelcomeScreen → AppButton
├── QuestionScreen (Stateful)
│   ├── QuestionIdentifier
│   ├── ChoiceButton (multiple)
│   └── AppButton
└── ResultScreen
    ├── Score Card (inline)
    ├── ResultItem (multiple)
    └── AppButton
```

## 🎓 Learning Outcomes Achieved

- ✅ Navigation between multiple screens using state
- ✅ Data passing between screens via parameters
- ✅ Separation of UI logic from business logic
- ✅ Clean architecture with data/model/UI layers
- ✅ State management in stateful widgets
- ✅ Reusable widget composition

## 📋 Quiz Data

The app includes 5 sample questions:
1. Who is the best teacher? (5 choices)
2. What is the best color? (3 choices)
3. Capital of France (4 choices)
4. Flutter programming language (4 choices)
5. Math question 2+2 (4 choices)

## 🔜 Future Enhancements (W10)

- Player name entry
- Edit quiz questions
- History of previous scores (Bonus)
- JSON persistence (Bonus)

---

**Submitted by**: [Your Name]  
**Course**: Flutter Mobile Development  
**Week**: 9 Practice Assignment
