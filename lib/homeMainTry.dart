import 'package:flutter/material.dart';
import 'package:tax_xpert/model/user_model.dart';
import 'package:tax_xpert/userDetail/entryField.dart';

class HomeScreenTry extends StatefulWidget {
  const HomeScreenTry({super.key});

  @override
  State<HomeScreenTry> createState() => _HomeScreenTryState();
}

UserModel? _user;

class _HomeScreenTryState extends State<HomeScreenTry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('${_user?.salary}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaxDeductionForm(),
                  ),
                );
              },
              child: const Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}
