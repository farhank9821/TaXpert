import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_xpert/Login_screen/widgets/textformfield.dart';
import 'package:tax_xpert/Repo/userbasicInfoRepo.dart';
import 'package:tax_xpert/form_fill/entryField.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(text: '-');
  final TextEditingController _phoneController = TextEditingController(text: "-");
  final TextEditingController _addressController = TextEditingController(text: "-");

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

  bool isShowPassword = true;
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
                "Create Account",
                style: GoogleFonts.exo(fontWeight: FontWeight.w800, fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                "Enter the required details!",
                style: GoogleFonts.exo(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
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
                  icon: const Icon(Icons.person),
                  hintText: "23",
                  controller: _ageController,
                  label: "Enter your Age",
                  onChange: (value) {},
                ),
              ),
            ),
            TextFormWidget(
              type: TextInputType.emailAddress,
              icon: const Icon(Icons.person),
              hintText: "abc@gmail.com",
              controller: _emailController,
              label: "Enter your Email",
              onChange: (value) {},
            ),
            TextFormWidget(
              type: TextInputType.phone,
              icon: const Icon(Icons.person),
              hintText: "xxxxx xxxxx",
              controller: _phoneController,
              label: "Enter your Phone Number",
              onChange: (value) {},
            ),
            TextFormWidget(
              type: TextInputType.streetAddress,
              icon: const Icon(Icons.person),
              hintText: "x/xxx xxxxxxx xxxxxxx",
              controller: _addressController,
              label: "Enter your Address",
              onChange: (value) {},
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary, // Change this to your desired color
              ),
              onPressed: _handleSubmit,
              child: Text("Submit", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface)),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final userBasic = ref.read(userBasicProvider.notifier);
      userBasic.updateUserBasicInfo(
        name: _nameController.text,
        age: int.tryParse(_ageController.text),
        address: _addressController.text,
        phone: _phoneController.text,
        email: _emailController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TaxDeductionForm()), // Adjust based on actual target screen
      );
    }
  }
}
