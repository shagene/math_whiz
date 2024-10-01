import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/math_problem.dart';

class SplashController extends StateNotifier<List<MathProblem>> {
  SplashController() : super(_initialProblems);

  static const List<MathProblem> _initialProblems = [
    MathProblem('2 + 2 = ?'),
    MathProblem('3 × 4 = ?'),
    MathProblem('10 ÷ 2 = ?'),
    MathProblem('5² = ?'),
    MathProblem('√16 = ?'),
  ];

  void rotateProblem() {
    final rotatedList = [...state.sublist(1), state.first];
    state = rotatedList;
  }
}

final splashControllerProvider =
    StateNotifierProvider<SplashController, List<MathProblem>>(
        (ref) => SplashController());
