import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/splash_controller.dart';

class RotatingMathProblems extends ConsumerWidget {
  const RotatingMathProblems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mathProblems = ref.watch(splashControllerProvider);

    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(5, (index) {
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 2 * pi),
              duration: const Duration(seconds: 10),
              builder: (context, value, child) {
                final angle = value - 0.4 * pi * index;
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle)
                    ..translate(100.0),
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: cos(angle).abs(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        mathProblems[index].problem,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
          const Icon(Icons.person, size: 100),
        ],
      ),
    );
  }
}
