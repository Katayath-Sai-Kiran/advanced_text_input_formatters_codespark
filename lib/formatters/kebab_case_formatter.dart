import 'package:flutter/services.dart';

/// Converts input into kebab-case.
/// Converts "Hello World" → "hello-world"
/// 
/// Example:
/// ```dart
/// TextField(inputFormatters: [KebabCaseFormatter()])
/// ```
class KebabCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final kebab = newValue.text
        .trim()
        .replaceAll(RegExp(r'\s+'), '-')
        .toLowerCase();
    return TextEditingValue(
      text: kebab,
      selection: TextSelection.collapsed(offset: kebab.length),
    );
  }
}
