import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/splash_controller.dart';
import '../widgets/rotating_math_problems.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _setupProblemRotation();
  }

  void _setupProblemRotation() {
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(splashControllerProvider.notifier).rotateProblem();
      _setupProblemRotation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Math Whiz',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const RotatingMathProblems(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
