import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully");
  } catch (e) {
    print("Failed to initialize Firebase: $e");
    // You might want to show an error dialog or handle this gracefully
  }

  // Add a delay to simulate app initialization
  await Future.delayed(const Duration(seconds: 2));

  runApp(const ProviderScope(child: App()));
}
