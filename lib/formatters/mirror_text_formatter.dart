import 'package:flutter/services.dart';

/// Reverses the input text in real-time.
/// Typing "hello" shows "olleh".
class MirrorTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final reversed = newValue.text.split('').reversed.join();
    return TextEditingValue(
      text: reversed,
      selection: TextSelection.collapsed(offset: reversed.length),
    );
  }
}
