import 'dart:async';
import 'package:flutter/material.dart';

/// A custom TextEditingController that simulates typing latency.
///
/// As characters are typed, this controller displays them one-by-one
/// with a fixed delay (like someone is typing it out).
///
/// Create the controller (with optional custom delay)
/// final TypingDelayController typingController = TypingDelayController(
///   delay: const Duration(milliseconds: 150),
/// );
///
/// /// Use inside a widget like Scaffold > body > Center > Column etc.
/// TextField(
///   controller: typingController,
///   onChanged: (value) {
///     // Prevent user from typing instantly — use delayed typing instead.
///     // This checks if the last character was manually added
///     if (value.isNotEmpty &&
///         !typingController.text.endsWith(value.characters.last)) {
///       typingController.typeCharacter(value.characters.last);
///     }
///   },
///   decoration: InputDecoration(
///     labelText: 'Typing Delay Input',
///     hintText: 'Try typing something...',
///     border: OutlineInputBorder(),
///   ),
/// )

class TypingDelayController extends TextEditingController {
  /// Delay duration between each character being added.
  final Duration delay;

  /// Internal buffer to hold the text that will be typed.
  String pendingText = '';

  /// A flag to indicate if the controller is currently simulating typing.
  bool _isTyping = false;

  /// Constructor to initialize the typing delay controller with custom delay.
  TypingDelayController({this.delay = const Duration(milliseconds: 200)});

  /// Overrides the default text setter so we can handle updates manually.
  @override
  set text(String newText) {
    // For programmatic updates, just set text immediately
    pendingText = newText;
    super.text = newText;
  }

  /// Sets the text with a character-by-character delay animation.
  ///
  /// Each character is appended with the specified [delay].
  void setTextWithDelay(String newText) async {
    // If already animating, ignore new requests
    if (_isTyping) return;
    _isTyping = true;

    pendingText = newText;
    String current = '';

    for (int i = 0; i < newText.length; i++) {
      await Future.delayed(delay);
      current += newText[i];
      super.text = current;
      // Keep cursor at the end while typing
      selection = TextSelection.collapsed(offset: current.length);
    }

    _isTyping = false;
  }

  /// Call this to add one character with delay (used from `onChanged`)
  void typeCharacter(String char) {
    setTextWithDelay(text + char);
  }

  /// Optionally, delete last character if needed
  void deleteLastCharacter() {
    if (text.isNotEmpty) {
      text = text.substring(0, text.length - 1);
    }
  }
}
