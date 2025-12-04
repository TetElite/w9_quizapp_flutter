import 'package:flutter/material.dart';
import 'data/quiz_data.dart';
import 'model/quiz.dart';
import 'ui/quiz_app.dart';
 
void main() {
  // 1 - Load the quiz data
  Quiz quiz = QuizData.getQuiz();

  // 2 - Display the quiz
  runApp(QuizApp(quiz: quiz));
}
