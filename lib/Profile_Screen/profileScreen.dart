import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_xpert/Login_screen/widgets/textformfield.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/auth_repo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/Repo/userbasicInfoRepo.dart';
import 'package:tax_xpert/model/userCalculationModel.dart';
import 'package:tax_xpert/model/user_basic_info.dart';
import 'package:tax_xpert/model/user_model.dart';

class Profile_Screen extends ConsumerStatefulWidget {
  const Profile_Screen({super.key});

  @override
  ConsumerState<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends ConsumerState<Profile_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userInfo = ref.read(userBasicProvider);
    _nameController.text = userInfo.name;
    _ageController.text = userInfo.age.toString();
    _emailController.text = userInfo.email ?? '-';
    _phoneController.text = userInfo.phoneNo ?? '-';
    _addressController.text = userInfo.address ?? '-';
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: logout,
              child: Text("Logout", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface)),
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
      ref.read(taxCalculationProvider);
      ref.read(userProvider);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All providers updated successfully!')),
      );
    }
  }

  Future<void> logout() async {
    await ref.read(authStateProvider.notifier).setLoggedIn(false);
    context.go('/login');
  }
}
