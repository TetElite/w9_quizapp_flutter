# Quiz App - Quick Reference Guide

## 🎯 User Flow Implementation

### 1️⃣ Welcome Screen
- Blue gradient background
- Quiz icon with question marks
- Quiz title display
- "Start Quiz" button

### 2️⃣ Question Screen  
- Question number badge (circular, blue)
- Question text
- Multiple choice buttons
- Selected choice highlighted
- Next/Finish button

### 3️⃣ Result Screen
- Score summary card
- "You answered X on Y!" message
- Individual question results:
  - ✅ Green = Correct answer
  - ❌ Red = Wrong answer
  - 💡 Correct answer shown for wrong selections
- "Restart Quiz" button

## 📦 Key Components

### Models (lib/model/quiz.dart)
```dart
Choice          // id, text
Question        // id, text, choices[], correctChoiceId
Quiz            // id, title, questions[]
PlayerAnswer    // questionId, selectedChoiceId, isCorrect
QuizResult      // quizId, quizTitle, playerAnswers[], score, percentage
```

### State Management (lib/ui/quiz_app.dart)
```dart
QuizApp (StatefulWidget)
  - _currentScreen: AppScreen enum
  - _currentQuestionIndex: int
  - _playerAnswers: List<PlayerAnswer>
  - _quizResult: QuizResult?
  
Methods:
  - _handleStartQuiz()
  - _handleAnswerSelected(choiceId)
  - _finishQuiz()
  - _handleRestartQuiz()
```

### Navigation Flow
```
WELCOME → [Start Quiz] → QUESTION (1) → QUESTION (2) → ... → RESULT → [Restart] → WELCOME
                           ↓                ↓
                      Answer Selected   Answer Selected
```

## 🎨 Color Scheme

- **Primary**: Blue (#2196F3 shades)
- **Success**: Green (correct answers)
- **Error**: Red (wrong answers)
- **Background**: White, Blue gradient
- **Text**: White (on color), Black87 (on white)

## 📋 Widget Hierarchy

```
MaterialApp
└── Scaffold
    └── QuizApp (Stateful)
        ├── WelcomeScreen
        │   ├── Container (gradient)
        │   ├── Quiz Icon
        │   └── AppButton
        │
        ├── QuestionScreen (Stateful)
        │   ├── QuestionIdentifier
        │   ├── Text (question)
        │   ├── ChoiceButton × N
        │   └── AppButton
        │
        └── ResultScreen
            ├── Score Card
            ├── ListView
            │   └── ResultItem × N
            └── AppButton
```

## 🧪 Testing

Run the test:
```bash
flutter test
```

Test verifies:
- Welcome screen loads with quiz title
- Start button is present

## 📊 Data Structure

Quiz questions stored in `lib/data/quiz_data.dart`:
- 5 questions
- Multiple choices per question
- Correct answer marked by ID
- Easy to extend with more questions

## 🔧 How to Modify

### Add New Question
Edit `lib/data/quiz_data.dart`:
```dart
Question(
  id: 'q6',
  text: 'Your question here?',
  choices: [
    Choice(id: 'c6_1', text: 'Option 1'),
    Choice(id: 'c6_2', text: 'Option 2'),
  ],
  correctChoiceId: 'c6_1',
),
```

### Change Colors
Edit individual screen files or create a theme in `quiz_app.dart`

### Modify Quiz Title
Edit `lib/data/quiz_data.dart` → `title` property

## 📱 Screen Sizes

App is responsive and works on:
- ✅ Mobile phones (primary)
- ✅ Tablets
- ✅ Web (responsive)

---

**Status**: ✅ Complete and ready for submission  
**All W9 requirements**: Implemented  
**Code quality**: Clean, documented, no errors
