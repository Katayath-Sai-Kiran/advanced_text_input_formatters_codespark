import 'package:flutter/services.dart';

/// Prevents multiple consecutive spaces.
/// Converts "hello   world" → "hello world"
/// 
/// Example:
/// ```dart
/// TextField(inputFormatters: [NoMultipleSpacesFormatter()])
/// ```
class NoMultipleSpacesFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final cleaned = newValue.text.replaceAll(RegExp(r'\s{2,}'), ' ');
    return TextEditingValue(
      text: cleaned,
      selection: TextSelection.collapsed(offset: cleaned.length),
    );
  }
}
