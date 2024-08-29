import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_xpert/Login_screen/widgets/textformfield.dart';
import 'package:tax_xpert/Repo/auth_repo.dart';
import 'package:tax_xpert/Repo/userbasicInfoRepo.dart';
import 'package:tax_xpert/form_fill/entryField.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    final userInfo = ref.read(userBasicProvider);
    _nameController = TextEditingController(text: userInfo.name);
    _ageController = TextEditingController(text: userInfo.age.toString());
    _emailController = TextEditingController(text: userInfo.email ?? '-');
    _phoneController = TextEditingController(text: userInfo.phoneNo ?? '-');
    _addressController = TextEditingController(text: userInfo.address ?? '-');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      int age = DateTime.now().year - selectedDate.year;
      if (DateTime.now().month < selectedDate.month || (DateTime.now().month == selectedDate.month && DateTime.now().day < selectedDate.day)) {
        age--;
      }
      _ageController.text = age.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Update Account",
                style: GoogleFonts.exo(fontWeight: FontWeight.w800, fontSize: 40),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                "Update your details!",
                style: GoogleFonts.exo(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            const SizedBox(height: 50),
            TextFormWidget(
              type: TextInputType.name,
              icon: const Icon(Icons.person),
              hintText: "Name",
              controller: _nameController,
              label: "Enter your Name",
              onChange: (value) {},
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormWidget(
                  type: TextInputType.number,
                  icon: const Icon(Icons.calendar_today),
                  hintText: "23",
                  controller: _ageController,
                  label: "Enter your Age",
                  onChange: (value) {},
                ),
              ),
            ),
            TextFormWidget(
              type: TextInputType.emailAddress,
              icon: const Icon(Icons.email),
              hintText: "abc@gmail.com",
              controller: _emailController,
              label: "Enter your Email",
              onChange: (value) {},
            ),
            TextFormWidget(
              type: TextInputType.phone,
              icon: const Icon(Icons.phone),
              hintText: "xxxxx xxxxx",
              controller: _phoneController,
              label: "Enter your Phone Number",
              onChange: (value) {},
            ),
            TextFormWidget(
              type: TextInputType.streetAddress,
              icon: const Icon(Icons.home),
              hintText: "x/xxx xxxxxxx xxxxxxx",
              controller: _addressController,
              label: "Enter your Address",
              onChange: (value) {},
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: _handleSubmit,
              child: Text("Update", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final userBasic = ref.read(userBasicProvider.notifier);
      await userBasic.updateUserBasicInfo(
        name: _nameController.text,
        age: int.tryParse(_ageController.text),
        address: _addressController.text,
        phone: _phoneController.text,
        email: _emailController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User information updated successfully!')),
      );
      await ref.read(authStateProvider.notifier).setLoggedIn(true);
      context.go('/');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const TaxDeductionForm()), // Adjust based on actual target screen
      // );
    }
  }
}
