import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'data/quiz_data.dart';
import 'model/quiz.dart';
import 'ui/quiz_app.dart';
 
void main() {
  // 1 - Load the quiz data
  Quiz quiz = QuizData.getQuiz();

  // 2 - Display the quiz with device preview
  runApp(
    DevicePreview(
      enabled: true, // Set to false to disable in production
      builder: (context) => QuizApp(quiz: quiz),
    ),
  );
}
