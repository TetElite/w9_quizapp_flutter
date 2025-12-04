import 'package:flutter/material.dart';
import '../model/quiz.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

/// Enum to represent different screens in the app
enum AppScreen {
  welcome,
  question,
  result,
}

class QuizApp extends StatefulWidget {
  final Quiz quiz;

  const QuizApp({
    super.key,
    required this.quiz,
  });

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // Current screen state
  AppScreen _currentScreen = AppScreen.welcome;
  
  // Current question index (0-based)
  int _currentQuestionIndex = 0;
  
  // List to store player answers
  final List<PlayerAnswer> _playerAnswers = [];
  
  // Quiz result (created after quiz completion)
  QuizResult? _quizResult;

  /// Handle starting the quiz
  void _handleStartQuiz() {
    setState(() {
      _currentScreen = AppScreen.question;
      _currentQuestionIndex = 0;
      _playerAnswers.clear();
      _quizResult = null;
    });
  }

  /// Handle answer selection for current question
  void _handleAnswerSelected(String choiceId) {
    final currentQuestion = widget.quiz.questions[_currentQuestionIndex];
    final isCorrect = currentQuestion.isCorrectAnswer(choiceId);
    
    // Store the player's answer
    _playerAnswers.add(PlayerAnswer(
      questionId: currentQuestion.id,
      selectedChoiceId: choiceId,
      isCorrect: isCorrect,
    ));

    // Move to next question or show results
    if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _finishQuiz();
    }
  }

  /// Finish the quiz and show results
  void _finishQuiz() {
    setState(() {
      _quizResult = QuizResult(
        quizId: widget.quiz.id,
        quizTitle: widget.quiz.title,
        playerAnswers: List.from(_playerAnswers),
      );
      _currentScreen = AppScreen.result;
    });
  }

  /// Restart the quiz
  void _handleRestartQuiz() {
    setState(() {
      _currentScreen = AppScreen.welcome;
      _currentQuestionIndex = 0;
      _playerAnswers.clear();
      _quizResult = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _buildCurrentScreen(),
      ),
    );
  }

  /// Build the current screen based on state
  Widget _buildCurrentScreen() {
    switch (_currentScreen) {
      case AppScreen.welcome:
        return WelcomeScreen(
          onStartQuiz: _handleStartQuiz,
          quizTitle: widget.quiz.title,
        );
      
      case AppScreen.question:
        final currentQuestion = widget.quiz.questions[_currentQuestionIndex];
        return QuestionScreen(
          question: currentQuestion,
          questionNumber: _currentQuestionIndex + 1,
          totalQuestions: widget.quiz.questions.length,
          onAnswerSelected: _handleAnswerSelected,
        );
      
      case AppScreen.result:
        return ResultScreen(
          quizResult: _quizResult!,
          quiz: widget.quiz,
          onRestart: _handleRestartQuiz,
        );
    }
  }
}
