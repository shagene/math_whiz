import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/home/presentation/screens/home_screen.dart';
import 'features/quiz/presentation/screens/quiz_page.dart';
import 'features/splash/presentation/screens/splash_screen.dart';
import 'providers/app_providers.dart'; // Update this import

final routerProvider = Provider<GoRouter>((ref) {
  final appInitialization = ref.watch(appInitializationProvider);

  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => appInitialization.when(
          data: (_) => const HomeScreen(),
          loading: () => const SplashScreen(),
          error: (_, __) => const Center(child: Text('Error initializing app')),
        ),
      ),
      GoRoute(
        path: '/quiz',
        builder: (context, state) => const QuizPage(),
      ),
    ],
  );
});
