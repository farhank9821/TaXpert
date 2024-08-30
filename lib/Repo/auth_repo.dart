import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState(isLoggedIn: false, isNewUser: false)) {
    _initializeAuthState();
  }

  Future<void> _initializeAuthState() async {
    final box = await Hive.openBox('authBox');
    final isLoggedIn = box.get('isLoggedIn', defaultValue: false);
    final isNewUser = box.get('isNewUser', defaultValue: true);
    state = AuthState(isLoggedIn: isLoggedIn, isNewUser: isNewUser);
  }

  Future<void> setLoggedIn(bool value) async {
    final box = await Hive.openBox('authBox');
    await box.put('isLoggedIn', value);
    state = state.copyWith(isLoggedIn: value);
  }

  Future<void> setNewUser(bool value) async {
    final box = await Hive.openBox('authBox');
    await box.put('isNewUser', value);
    state = state.copyWith(isNewUser: value);
  }
}

class AuthState {
  final bool isLoggedIn;
  final bool isNewUser;

  AuthState({
    required this.isLoggedIn,
    required this.isNewUser,
  });

  AuthState copyWith({
    bool? isLoggedIn,
    bool? isNewUser,
  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isNewUser: isNewUser ?? this.isNewUser,
    );
  }
}
