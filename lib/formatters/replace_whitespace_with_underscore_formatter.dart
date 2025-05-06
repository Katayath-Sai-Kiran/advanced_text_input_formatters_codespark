import 'package:flutter/services.dart';

/// Replaces all whitespace with underscores.
/// Converts "this is text" → "this_is_text"
/// 
/// Example:
/// ```dart
/// TextField(inputFormatters: [WhitespaceToUnderscoreFormatter()])
/// ```
class WhitespaceToUnderscoreFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final modified = newValue.text.replaceAll(RegExp(r'\s+'), '_');
    return TextEditingValue(
      text: modified,
      selection: TextSelection.collapsed(offset: modified.length),
    );
  }
}
