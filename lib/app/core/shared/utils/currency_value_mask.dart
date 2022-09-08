import 'package:flutter/services.dart';

class CurrencyValueMask extends TextInputFormatter {
  final String decimal;

  CurrencyValueMask({required this.decimal});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = newValue.text.replaceAll(RegExp(r'\D'), '');
    final listCharacters = [];
    var decimalCount = 0;

    value = value.split('').reversed.join();

    for (var i = 0; i < value.length; i++) {
      if (i > 0) {
        decimalCount++;
      }
      if (decimalCount == 3) {
        listCharacters.insert(0, '.');
        decimalCount = 0;
      }
      listCharacters.insert(0, value[i]);
    }

    var formatted = listCharacters.join();
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formatted.length),
      ),
    );
  }
}
