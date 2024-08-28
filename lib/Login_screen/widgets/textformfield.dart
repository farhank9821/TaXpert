import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final TextInputType type;
  final Widget icon;
  final String hintText;
  final TextEditingController controller;
  final String label;
  final ValueChanged<String> onChange;

  const TextFormWidget({
    super.key,
    required this.type,
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.label,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          onChanged: onChange,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.primary),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: theme.colorScheme.primaryContainer, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            ),
            prefixIcon: icon, // Add icon to InputDecoration
            hintText: hintText,
          ),
          style: theme.textTheme.bodyMedium,
          keyboardType: type,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
    );
  }
}
