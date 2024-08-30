// number_to_words_converter.dart

import 'package:flutter/material.dart';

class NumberToWordsConverter {
  String numberToWords(int number) {
    if (number == 0) return 'Zero';

    final units = [
      '',
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Eleven',
      'Twelve',
      'Thirteen',
      'Fourteen',
      'Fifteen',
      'Sixteen',
      'Seventeen',
      'Eighteen',
      'Nineteen'
    ];

    final tens = ['', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];

    if (number < 20) return units[number];
    if (number < 100) {
      return tens[number ~/ 10] + (number % 10 > 0 ? ' ${units[number % 10]}' : '');
    }
    if (number < 1000) {
      return '${units[number ~/ 100]} Hundred${number % 100 > 0 ? ' and ${numberToWords(number % 100)}' : ''}';
    }

    if (number < 100000) {
      return '${numberToWords(number ~/ 1000)} Thousand${number % 1000 > 0 ? ' ${numberToWords(number % 1000)}' : ''}';
    }

    if (number < 10000000) {
      return '${numberToWords(number ~/ 100000)} Lakh${number % 100000 > 0 ? ' ${numberToWords(number % 100000)}' : ''}';
    }

    return '${numberToWords(number ~/ 10000000)} Crore${number % 10000000 > 0 ? ' ${numberToWords(number % 10000000)}' : ''}';
  }
}
