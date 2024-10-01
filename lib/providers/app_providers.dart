import 'package:flutter_riverpod/flutter_riverpod.dart';

final appInitializationProvider = FutureProvider<void>((ref) async {
  // Simulate app initialization
  await Future.delayed(const Duration(seconds: 2));
});
