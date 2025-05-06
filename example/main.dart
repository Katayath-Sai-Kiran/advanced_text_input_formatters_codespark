import 'package:advanced_text_input_formatters_codespark/controllers/typing_delay_controller.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/camel_case_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/digits_only_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/kebab_case_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/mirror_text_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/no_paste_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/no_repeat_characters_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/only_alphabets_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/palindrome_only_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/prevent_multiple_spaces_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/replace_whitespace_with_underscore_formatter.dart';
import 'package:advanced_text_input_formatters_codespark/formatters/snake_case_formatter.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Formatter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Formatter Playground')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: FormatterDemo(),
        ),
      ),
    );
  }
}

class FormatterDemo extends StatelessWidget {
  const FormatterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final typingController = TypingDelayController();
    return ListView(
      children: [
        const Text('Digits Only'),
        TextField(inputFormatters: [DigitsOnlyFormatter()]),

        const SizedBox(height: 20),
        const Text('Input Mirror'),
        TextField(inputFormatters: [MirrorTextFormatter()]),

        const SizedBox(height: 20),
        const Text('Prevent Repeat Characters'),
        TextField(inputFormatters: [NoRepeatCharactersFormatter()]),

        const SizedBox(height: 20),
        const Text('Block Clipboard (no paste)'),
        TextField(inputFormatters: [NoPasteFormatter()]),

        const SizedBox(height: 20),
        const Text('Only Palindromes'),
        TextField(inputFormatters: [PalindromeOnlyFormatter()]),

        const SizedBox(height: 20),
        const Text('Only Alphabets'),
        TextField(inputFormatters: [OnlyAlphabetsFormatter()]),

        const SizedBox(height: 20),
        const Text('CamelCase'),
        TextField(inputFormatters: [CamelCaseFormatter()]),

        const SizedBox(height: 20),
        const Text('snake_case'),
        TextField(inputFormatters: [SnakeCaseFormatter()]),

        const SizedBox(height: 20),
        const Text('kebab-case'),
        TextField(inputFormatters: [KebabCaseFormatter()]),

        const SizedBox(height: 20),
        const Text('Whitespace → Underscores'),
        TextField(inputFormatters: [WhitespaceToUnderscoreFormatter()]),

        const SizedBox(height: 20),
        const Text('Prevent multiple spaces'),
        TextField(inputFormatters: [NoMultipleSpacesFormatter()]),

        const SizedBox(height: 20),
        const Text('Typing Delay (simulated typing)'),
        TextField(
          controller: typingController,
          onChanged: (value) {
            if (!typingController.text.endsWith(value.characters.last)) {
              typingController.typeCharacter(value.characters.last);
            }
          },
        ),
      ],
    );
  }
}
