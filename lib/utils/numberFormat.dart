import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat("#,##,##0");

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty || double.tryParse(newValue.text.replaceAll(',', '')) == null) {
      return oldValue;
    }

    double value = double.parse(newValue.text.replaceAll(',', ''));
    String formattedValue = numberFormat.format(value);

    int cursorPosition = formattedValue.length - (newValue.text.length - newValue.selection.baseOffset);

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
