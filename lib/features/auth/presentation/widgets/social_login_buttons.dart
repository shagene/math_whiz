import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _socialLoginButton('Google', Icons.g_mobiledata, () {
          // TODO: Implement Google sign-in
        }),
        _socialLoginButton('Twitter', Icons.flutter_dash, () {
          // TODO: Implement Twitter sign-in
        }),
        _socialLoginButton('Facebook', Icons.facebook, () {
          // TODO: Implement Facebook sign-in
        }),
        _socialLoginButton('Apple', Icons.apple, () {
          // TODO: Implement Apple sign-in
        }),
      ],
    );
  }

  Widget _socialLoginButton(
      String label, IconData icon, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
