import 'package:flutter/services.dart';

/// Formats input into CamelCase.
/// Converts "hello world" → "helloWorld"
///
/// Example:
/// ```dart
/// TextField(inputFormatters: [CamelCaseFormatter()])
/// ```
class CamelCaseFormatter extends TextInputFormatter {
  String _toCamelCase(String input) {
    final words = input.split(RegExp(r'\s+'));
    if (words.isEmpty) return '';
    final first = words.first.toLowerCase();
    final rest =
        words
            .skip(1)
            .map(
              (w) =>
                  w.isNotEmpty
                      ? w[0].toUpperCase() + w.substring(1).toLowerCase()
                      : '',
            )
            .join();
    return first + rest;
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final camel = _toCamelCase(newValue.text);
    return TextEditingValue(
      text: camel,
      selection: TextSelection.collapsed(offset: camel.length),
    );
  }
}
