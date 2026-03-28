part of 'onboarding_cubit.dart';

class OnboardingState {
  final int index;
  final bool isLast;
  final bool isDone; // ✅ أضف ده

  OnboardingState({
    required this.index,
    required this.isLast,
    this.isDone = false,
  });

  OnboardingState copyWith({int? index, bool? isLast, bool? isDone}) {
    return OnboardingState(
      index: index ?? this.index,
      isLast: isLast ?? this.isLast,
      isDone: isDone ?? this.isDone,
    );
  }
}