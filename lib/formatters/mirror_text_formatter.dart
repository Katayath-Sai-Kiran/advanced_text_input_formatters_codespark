import 'package:flutter/services.dart';

class MirrorTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value is empty, return the old value
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Get the last character of the new value
    String newText = newValue.text[newValue.text.length - 1] + oldValue.text;

    // Return the updated TextEditingValue with the mirrored text
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
