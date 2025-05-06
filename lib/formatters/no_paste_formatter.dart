import 'package:flutter/services.dart';

/// Disables pasting by checking for multi-character updates.
class NoPasteFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if ((newValue.text.length - oldValue.text.length) > 1) {
      return oldValue;
    }
    return newValue;
  }
}
