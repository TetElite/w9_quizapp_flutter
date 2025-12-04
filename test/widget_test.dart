// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:w9_quizapp/data/quiz_data.dart';
import 'package:w9_quizapp/ui/quiz_app.dart';

void main() {
  testWidgets('Quiz app loads welcome screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final quiz = QuizData.getQuiz();
    await tester.pumpWidget(QuizApp(quiz: quiz));

    // Verify that welcome screen is shown
    expect(find.text('Teacher & Colors Quiz'), findsOneWidget);
    expect(find.text('Start Quiz'), findsOneWidget);
  });
}
