import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/complete_onboarding.dart';
part 'onboarding_state.dart';


class OnboardingCubit extends Cubit<OnboardingState> {
  final CompleteOnboarding completeOnboarding;

  OnboardingCubit(this.completeOnboarding)
      : super(OnboardingState(index: 0, isLast: false));

  final PageController controller = PageController();

  void onPageChanged(int i, int total) {
    emit(state.copyWith(
      index: i,
      isLast: i == total - 1,
    ));
  }

  Future<void> next(int total) async {
  if (!state.isLast) {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  } else {
    await completeOnboarding();
    emit(state.copyWith(isDone: true)); 
  }
}

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}