import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_xpert/Login_screen/loginScreen.dart';
import 'package:tax_xpert/MainSection/navigationbarScreen.dart';
import 'package:tax_xpert/Repo/auth_repo.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      if (!authState && state.uri.toString() != '/login') {
        return '/login';
      }
      if (authState && (state.uri.toString() == '/login')) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const BottomNavigationScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const Signup(),
      ),
    ],
  );
});
