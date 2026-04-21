import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.currentStep,
    required this.onNext,
    required this.onBack,
    required this.canContinue,
    required this.isSubmitting,
  });

  final int currentStep;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final bool canContinue;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (currentStep > 0)
            TextButton(
              onPressed: onBack,
              child: const Text("Back"),
            ),
          const Spacer(),
          ElevatedButton(
            onPressed: canContinue && !isSubmitting ? onNext : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: isSubmitting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(currentStep == 2 ? "Finish" : "Continue"),
          )
        ],
      ),
    );
  }
}
