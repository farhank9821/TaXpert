import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, bool>((ref) {
  return AuthStateNotifier();
});

class AuthStateNotifier extends StateNotifier<bool> {
  AuthStateNotifier() : super(false) {
    _initializeAuthState();
  }

  Future<void> _initializeAuthState() async {
    final box = await Hive.openBox('authBox');
    state = box.get('isLoggedIn', defaultValue: false);
  }

  Future<void> setLoggedIn(bool value) async {
    final box = await Hive.openBox('authBox');
    await box.put('isLoggedIn', value);
    state = value;
  }
}
