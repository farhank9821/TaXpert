import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/Login_screen/loginScreen.dart';
import 'package:tax_xpert/form_fill/entryField.dart';
import 'package:tax_xpert/utils/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tax Xpert',
      theme: ThemeData(
        textTheme: myTextTheme,
        colorScheme: myColorScheme,
      ),
      home: const Signup(),
    );
  }
}
