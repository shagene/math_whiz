import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../logic/auth_controller.dart';
import '../widgets/email_password_form.dart';
import '../widgets/social_login_buttons.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailPasswordForm(
                  onLogin: (email, password) {
                    ref
                        .read(authControllerProvider.notifier)
                        .signInWithEmailAndPassword(email, password);
                  },
                  onRegister: (email, password) {
                    ref
                        .read(authControllerProvider.notifier)
                        .registerWithEmailAndPassword(email, password);
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // TODO: Implement guest login
                    context.go('/home');
                  },
                  child: const Text('Continue as Guest'),
                ),
                const SizedBox(height: 16),
                const Text('Or sign in with:'),
                const SizedBox(height: 16),
                const SocialLoginButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
