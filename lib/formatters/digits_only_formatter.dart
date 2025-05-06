import 'package:flutter/services.dart';

/// A [TextInputFormatter] that allows only digits (0-9) to be entered.
///
/// This formatter removes any non-digit characters from the input in real-time.
/// Ideal for inputs like phone numbers, OTPs, PINs, and numeric IDs.
///
/// TextField(
///   keyboardType: TextInputType.number,
///   inputFormatters: [
///     DigitsOnlyFormatter(),
///   ],
///   decoration: InputDecoration(
///     labelText: 'Enter digits only',
///     border: OutlineInputBorder(),
///   ),
/// ),

class DigitsOnlyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Replace all non-digit characters using RegExp [^0-9]
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    return newValue.copyWith(
      // Set the cleaned (digits-only) text
      text: digitsOnly,

      // Adjust the selection (cursor) to the end of the new digits-only text
      selection: TextSelection.collapsed(offset: digitsOnly.length),
    );
  }
}
