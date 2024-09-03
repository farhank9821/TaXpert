import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/utils/number_to_words.dart';

class CustomTF extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final String label;
  final Function(String) onChange;

  const CustomTF(this.controller, this.label, this.onChange, {super.key});

  @override
  _CustomTFState createState() => _CustomTFState();
}

class _CustomTFState extends ConsumerState<CustomTF> {
  final NumberToWordsConverter _converter = NumberToWordsConverter(); // Instantiate the class
  String _labelText = '';
  void _updateLabelText(String value) {
    if (value.isEmpty) {
      setState(() {
        _labelText = widget.label;
      });
      return;
    }

    int val = int.parse(widget.controller.text.replaceAll(',', ''));

    setState(() {
      _labelText = _converter.numberToWords(val); // Use the class method
    });
  }

  @override
  void initState() {
    super.initState();
    _labelText = widget.label; // Initialize label text with widget.label
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) {
          // Remove commas and convert empty string to '0'
          String parsedValue = value.replaceAll(',', '');
          parsedValue = parsedValue.isEmpty ? '0' : parsedValue;

          // Update the controller with formatted value
          double? numericValue = double.tryParse(parsedValue);
          if (numericValue != null) {
            String formattedValue = NumberFormat('#,##,##0').format(numericValue);
            widget.controller.value = TextEditingValue(
              text: formattedValue,
              selection: TextSelection.collapsed(offset: formattedValue.length),
            );
          }

          widget.onChange(parsedValue);
          // Recalculate tax
          ref.read(taxCalculationProvider.notifier).calculateTax(
                ref.read(userProvider),
                ref,
              );

          _updateLabelText(value);
        },
        decoration: InputDecoration(
          filled: true,
          labelText: _labelText,
          fillColor: Theme.of(context).colorScheme.onTertiary,
          labelStyle: Theme.of(context).textTheme.titleSmall,
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.surface.withOpacity(0.8)),
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
          LengthLimitingTextInputFormatter(15),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a number';
          }
          return null;
        },
      ),
    );
  }
}
