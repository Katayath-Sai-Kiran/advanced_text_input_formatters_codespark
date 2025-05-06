import 'package:flutter/services.dart';

/// Allows only alphabetic characters (A-Z, a-z). Blocks digits and symbols.
///
/// Example:
/// ```dart
/// TextField(inputFormatters: [OnlyAlphabetsFormatter()])
/// ```
class OnlyAlphabetsFormatter extends TextInputFormatter {
  final RegExp _alphaRegex = RegExp(r'[a-zA-Z]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final filtered =
        newValue.text.split('').where((c) => _alphaRegex.hasMatch(c)).join();
    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }
}
