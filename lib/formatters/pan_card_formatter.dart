import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class PanCardInputHelper {
  /// TextInputFormatter enforcing PAN structure: AAAAA9999A
  static final TextInputFormatter formatter = _PanCardFormatter();

  /// PAN validation regex: 5 letters, 4 digits, 1 letter
  static final RegExp panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');

  /// Returns ideal keyboardType based on current input
  static TextInputType getKeyboardType(String text) {
    final int length = text.length;
    if (length < 5) return TextInputType.text;
    if (length < 9) return TextInputType.number;
    return TextInputType.text;
  }

  /// Validates PAN format. Returns null if valid, else error string.
  static String? validate(String value) {
    final upper = value.toUpperCase();
    if (!panRegex.hasMatch(upper)) {
      return 'Enter a valid PAN (e.g. ABCDE1234F)';
    }
    return null;
  }

  /// Optional listener helper if dev wants callback when type changes
  static void attachListener({
    required TextEditingController controller,
    required void Function(TextInputType newType) onKeyboardTypeChange,
  }) {
    controller.addListener(() {
      final newType = getKeyboardType(controller.text);
      onKeyboardTypeChange(newType);
    });
  }
}

/// Internal formatter to enforce live input structure
class _PanCardFormatter extends TextInputFormatter {
  final RegExp _partialRegex = RegExp(r'^[A-Z]{0,5}[0-9]{0,4}[A-Z]?$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final upper = newValue.text.toUpperCase();

    if (_partialRegex.hasMatch(upper)) {
      return newValue.copyWith(
        text: upper,
        selection: TextSelection.collapsed(offset: upper.length),
      );
    }

    // Reject change if not valid so far
    return oldValue;
  }
}
