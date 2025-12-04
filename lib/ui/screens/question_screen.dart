import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/choice_button.dart';
import '../widgets/question_identifier.dart';
import '../widgets/app_button.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  final int questionNumber;
  final int totalQuestions;
  final Function(String choiceId) onAnswerSelected;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onAnswerSelected,
  });
  
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? _selectedChoiceId;

  void _handleChoiceSelected(String choiceId) {
    setState(() {
      _selectedChoiceId = choiceId;
    });
  }

  void _handleSubmit() {
    if (_selectedChoiceId != null) {
      widget.onAnswerSelected(_selectedChoiceId!);
      // Reset selection for next question
      setState(() {
        _selectedChoiceId = null;
      });
    }
  }

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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Question identifier (number badge)
              QuestionIdentifier(
                questionNumber: widget.questionNumber,
                totalQuestions: widget.totalQuestions,
              ),
              const SizedBox(height: 40),
              
              // Question text
              Text(
                widget.question.text,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // Choices
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: widget.question.choices.map((choice) {
                      return ChoiceButton(
                        text: choice.text,
                        isSelected: _selectedChoiceId == choice.id,
                        onTap: () => _handleChoiceSelected(choice.id),
                      );
                    }).toList(),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Next/Submit button
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  widget.questionNumber < widget.totalQuestions ? 'Next' : 'Finish',
                  onTap: _selectedChoiceId != null ? _handleSubmit : () {},
                  icon: widget.questionNumber < widget.totalQuestions 
                      ? Icons.arrow_forward 
                      : Icons.check,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
