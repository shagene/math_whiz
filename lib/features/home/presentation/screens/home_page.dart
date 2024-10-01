import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Math Whiz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/quiz'),
              child: const Text('Start Quiz'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: const Text('View Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
