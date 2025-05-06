

```markdown
# Changelog

All notable changes to this project will be documented in this file.

## [0.0.1] - Initial Release

### Added
- `DigitsOnlyFormatter`: Allows only numeric input.
- `InputMirrorFormatter`: Reverses text as it's typed.
- `PreventRepeatCharactersFormatter`: Blocks repeated consecutive characters.
- `BlockClipboardFormatter`: Disables clipboard access (e.g., paste).
- `PalindromeOnlyFormatter`: Allows only palindromic text.
- `OnlyAlphabetsFormatter`: Accepts only alphabetic characters.
- `CamelCaseInputFormatter`: Converts input to camelCase style.
- `SnakeCaseInputFormatter`: Converts input to snake_case format.
- `KebabCaseInputFormatter`: Converts input to kebab-case format.
- `WhitespaceToUnderscoreFormatter`: Replaces all spaces with underscores.
- `SingleSpaceFormatter`: Prevents multiple consecutive spaces.
- `TypingDelayController`: Simulates typing delay for controlled input.
- `Example App`: Added a demo app to test all formatters live.
- `formatters.dart`: Export file for easy imports.

## 🔮 Future Updates (Planned)

- `ChainedInputFormatter`: Combine multiple formatters into one with configurable options.
- Regex-driven formatter builder for advanced customization.
- Formatter playground web preview (Flutter web).
- Formatter behavior toggle (live vs. strict validation).
- Locale-aware formatting support.
- Unit & widget test coverage for all formatters.
- Performance benchmarking for formatter chains.

```
