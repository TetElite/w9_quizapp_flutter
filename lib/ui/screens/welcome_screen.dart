import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStartQuiz;
  final String quizTitle;

  const WelcomeScreen({
    super.key,
    required this.onStartQuiz,
    required this.quizTitle,
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Quiz icon with question marks
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.quiz,
                      size: 80,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '?',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          '?',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            // Title
            Text(
              quizTitle,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            // Start button
            AppButton(
              'Start Quiz',
              onTap: onStartQuiz,
              icon: Icons.play_arrow,
            ),
          ],
        ),
      ),
    );
  }
}

