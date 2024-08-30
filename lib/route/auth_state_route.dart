import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_xpert/Login_screen/loginScreen.dart';
import 'package:tax_xpert/Repo/auth_repo.dart';
import 'package:tax_xpert/form_fill/entryField.dart';

import '../MainSection/navigationbarScreen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      if (!authState.isLoggedIn) {
        if (state.uri.toString() != '/login') {
          return '/login';
        }
      } else {
        if (authState.isNewUser && state.uri.toString() != '/tax-form') {
          return '/tax-form';
        }
        if (!authState.isNewUser && state.uri.toString() != '/') {
          return '/';
        }
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
      GoRoute(
        path: '/tax-form',
        builder: (context, state) => const TaxDeductionForm(),
      ),
    ],
  );
});
