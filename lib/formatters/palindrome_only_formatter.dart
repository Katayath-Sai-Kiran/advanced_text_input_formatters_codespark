import 'package:flutter/services.dart';

/// Allows only palindrome input (e.g., "madam", "racecar").
/// If non-palindromic, input is reverted.
class PalindromeOnlyFormatter extends TextInputFormatter {
  bool _isPalindrome(String input) {
    final normalized = input.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    return normalized == normalized.split('').reversed.join();
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return _isPalindrome(newValue.text) ? newValue : oldValue;
  }
}
