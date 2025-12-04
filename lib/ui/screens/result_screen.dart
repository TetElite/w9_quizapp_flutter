import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/app_button.dart';
import '../widgets/result_item.dart';

class ResultScreen extends StatelessWidget {
  final QuizResult quizResult;
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quizResult,
    required this.quiz,
    required this.onRestart,
  });
   
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade400,
            Colors.blue.shade700,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Score card header
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  const Text(
                    'Quiz Complete!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Score display
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'You answered ${quizResult.score} on ${quizResult.totalQuestions}!',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildScoreBadge(
                              'Score',
                              '${quizResult.score}',
                              Colors.green,
                            ),
                            const SizedBox(width: 16),
                            _buildScoreBadge(
                              'Total',
                              '${quizResult.totalQuestions}',
                              Colors.blue,
                            ),
                            const SizedBox(width: 16),
                            _buildScoreBadge(
                              'Accuracy',
                              '${quizResult.percentage.toStringAsFixed(0)}%',
                              Colors.orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Results list
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Text(
                        'Question Results',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: quizResult.playerAnswers.length,
                        itemBuilder: (context, index) {
                          final playerAnswer = quizResult.playerAnswers[index];
                          final question = quiz.questions[index];
                          return ResultItem(
                            question: question,
                            playerAnswer: playerAnswer,
                            questionNumber: index + 1,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Restart button
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        'Restart Quiz',
                        onTap: onRestart,
                        icon: Icons.refresh,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreBadge(String label, String value, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
