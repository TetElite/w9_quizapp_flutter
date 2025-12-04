// Domain models for the quiz application

/// Represents a single choice/answer option for a question
class Choice {
  final String id;
  final String text;

  const Choice({
    required this.id,
    required this.text,
  });
}

/// Represents a quiz question with multiple choices and correct answer
class Question {
  final String id;
  final String text;
  final List<Choice> choices;
  final String correctChoiceId;

  const Question({
    required this.id,
    required this.text,
    required this.choices,
    required this.correctChoiceId,
  });

  /// Check if a given choice ID is correct
  bool isCorrectAnswer(String choiceId) {
    return choiceId == correctChoiceId;
  }

  /// Get the correct choice text
  String getCorrectChoiceText() {
    return choices.firstWhere((c) => c.id == correctChoiceId).text;
  }

  /// Get choice text by ID
  String getChoiceText(String choiceId) {
    return choices.firstWhere((c) => c.id == choiceId).text;
  }
}

/// Represents a complete quiz with title and questions
class Quiz {
  final String id;
  final String title;
  final List<Question> questions;

  const Quiz({
    required this.id,
    required this.title,
    required this.questions,
  });
}

/// Represents a player's answer to a specific question
class PlayerAnswer {
  final String questionId;
  final String selectedChoiceId;
  final bool isCorrect;

  const PlayerAnswer({
    required this.questionId,
    required this.selectedChoiceId,
    required this.isCorrect,
  });
}

/// Represents the complete result of a quiz attempt
class QuizResult {
  final String quizId;
  final String quizTitle;
  final List<PlayerAnswer> playerAnswers;
  final DateTime completedAt;

  QuizResult({
    required this.quizId,
    required this.quizTitle,
    required this.playerAnswers,
    DateTime? completedAt,
  }) : completedAt = completedAt ?? DateTime.now();

  /// Calculate the score (number of correct answers)
  int get score {
    return playerAnswers.where((answer) => answer.isCorrect).length;
  }

  /// Get total number of questions
  int get totalQuestions {
    return playerAnswers.length;
  }

  /// Calculate percentage score
  double get percentage {
    if (totalQuestions == 0) return 0.0;
    return (score / totalQuestions) * 100;
  }
}
