import 'package:flutter/services.dart';

/// Converts input into snake_case.
/// Converts "Hello World" → "hello_world"
/// 
/// Example:
/// ```dart
/// TextField(inputFormatters: [SnakeCaseFormatter()])
/// ```
class SnakeCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final snake = newValue.text
        .trim()
        .replaceAll(RegExp(r'\s+'), '_')
        .toLowerCase();
    return TextEditingValue(
      text: snake,
      selection: TextSelection.collapsed(offset: snake.length),
    );
  }
}
