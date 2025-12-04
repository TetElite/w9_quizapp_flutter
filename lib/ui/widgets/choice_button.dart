import 'package:flutter/material.dart';

/// Reusable button widget for answer choices
class ChoiceButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool? isCorrect;
  final VoidCallback onTap;

  const ChoiceButton({
    super.key,
    required this.text,
    required this.isSelected,
    this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor = Colors.white;
    
    if (isCorrect != null) {
      if (isCorrect!) {
        backgroundColor = Colors.green;
      } else if (isSelected) {
        backgroundColor = Colors.red;
      } else {
        backgroundColor = Colors.grey.shade300;
        textColor = Colors.black87;
      }
    } else {
      backgroundColor = isSelected ? Colors.blue.shade700 : Colors.blue.shade100;
      textColor = isSelected ? Colors.white : Colors.black87;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isCorrect != null ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: isSelected ? 4 : 1,
        ),
        child: Row(
          children: [
            if (isCorrect != null) ...[
              Icon(
                isCorrect! ? Icons.check_circle : (isSelected ? Icons.cancel : Icons.circle_outlined),
                color: textColor,
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
