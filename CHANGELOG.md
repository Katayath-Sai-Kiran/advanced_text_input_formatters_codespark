## [0.0.4] - 2025-06-05

### ✨ Added
- 🆕 `PanCardInputHelper`: A smart PAN card formatter with built-in validation and keyboard type switching.
  - Enforces format: `ABCDE1234F`
  - Automatically switches keyboardType: `text → number → text`
  - Includes optional validator method
  - Provides static method for keyboard control and input enforcement
- 🧠 Dynamic `keyboardType` support using `ValueKey` to force rebuilds
- 🔧 Utility method `PanCardInputHelper.attachListener` for dynamic input reaction

---

## [0.0.3] - 2025-05-27

### 🧑‍💻 Added 
- Maintainer metadata

---

## [0.0.2] - 2025-05-04

### 🎨 Added
- 📦 Package banner added: Improves visibility on pub.dev
- 🧹 Code formatting and cleanup
- 🔖 Topics added to `pubspec.yaml` to enhance discoverability

### 📝 Notes
Visual and structural improvements only—no changes to functionality.

---

## [0.0.1] - Initial Release

### 📌 Added
- `DigitsOnlyFormatter`: Allows only numeric input
- `InputMirrorFormatter`: Reverses text as it's typed
- `PreventRepeatCharactersFormatter`: Blocks repeated consecutive characters
- `BlockClipboardFormatter`: Disables clipboard access (e.g., paste)
- `PalindromeOnlyFormatter`: Allows only palindromic text
- `OnlyAlphabetsFormat
