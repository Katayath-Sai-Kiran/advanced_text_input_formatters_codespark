import 'package:flutter/services.dart';

/// Prevents repeated characters from being entered.
/// Example: "aabbcc" becomes "abc".
class NoRepeatCharactersFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final buffer = StringBuffer();
    for (int i = 0; i < newValue.text.length; i++) {
      if (i == 0 || newValue.text[i] != newValue.text[i - 1]) {
        buffer.write(newValue.text[i]);
      }
    }
    final cleaned = buffer.toString();
    return TextEditingValue(
      text: cleaned,
      selection: TextSelection.collapsed(offset: cleaned.length),
    );
  }
}
