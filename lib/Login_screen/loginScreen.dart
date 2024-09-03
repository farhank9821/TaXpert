// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tax_xpert/Login_screen/widgets/textformfield.dart';
import 'package:tax_xpert/Repo/auth_repo.dart';
import 'package:tax_xpert/Repo/userbasicInfoRepo.dart';

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
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
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
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 100.0, // Increased for more space
              floating: false,
              pinned: true,
              backgroundColor: Colors.black,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var top = constraints.biggest.height;
                  var collapsedHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
                  var expandedHeight = 200.0; // Should match expandedHeight above
                  var t = ((top - collapsedHeight) / (expandedHeight - collapsedHeight)).clamp(0.0, 1.0);

                  return FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: const EdgeInsets.only(
                      left: 16,
                    ),
                    title: Opacity(
                      opacity: 1.0, // Always visible
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 24 + (t * 8), // Scales from 24 to 32
                                  color: Colors.white,
                                ),
                          ),
                          SizedBox(height: 4 * t), // Dynamic spacing
                          Text(
                            "Add your details !",
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 16 + (t * 4), // Scales from 16 to 20
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Lottie.asset('assets/login_screen.json'),
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
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: _handleSubmit,
                          child:
                              Text("Update", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface)),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
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
        age: int.tryParse(_ageController.text) ?? 0,
        address: _addressController.text,
        phone: _phoneController.text,
        email: _emailController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User information updated successfully!'),
        ),
      );

      await ref.read(authStateProvider.notifier).setLoggedIn(true);
      await ref.read(authStateProvider.notifier).setNewUser(false);
      context.go('/');
    }
  }
}
