
<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/advanced_text_input_formatters_codespark/master/assets/banner.png" alt="Banner"/>

## ✨ TextInputFormatters Included

A collection of custom `TextInputFormatter`s designed to enhance and control user input in Flutter apps.


### 🔠 **Typing Delay Formatter**

Mimics human-like typing latency by preventing direct typing and simulating delayed character-by-character input.

```dart
/// Example:
TypingDelayController typingController = TypingDelayController();

TextField(
  controller: typingController,
  onChanged: (value) {
    if (!typingController.text.endsWith(value.characters.last)) {
      typingController.typeCharacter(value.characters.last);
    }
  },
)
```

---

### 🔢 **Digits Only Formatter**

Allows only numeric digits (0–9).

```dart
/// Example:
TextField(
  inputFormatters: [DigitsOnlyFormatter()],
)
```

---

### 🔁 **Input Mirror Formatter**

Reverses the text in real-time as the user types.

```dart
/// Example:
TextField(
  inputFormatters: [InputMirrorFormatter()],
)
```

**Input:** `hello` → **Displayed:** `olleh`

---

### 🚫 **Prevent Repeat Characters**

Blocks repeated characters (e.g., `aa` → `a`).

```dart
/// Example:
TextField(
  inputFormatters: [PreventRepeatCharactersFormatter()],
)
```

---

### ✂️ **Block Clipboard Access**

Disables pasting text into the field via the clipboard.

```dart
/// Example:
TextField(
  inputFormatters: [BlockClipboardFormatter()],
)
```

---

### 🪞 **Only Palindromes Allowed**

Allows only input that is a valid palindrome (same forwards and backwards).

```dart
/// Example:
TextField(
  inputFormatters: [PalindromeOnlyFormatter()],
)
```

**Allowed Input:** `madam`, `racecar`  
**Blocked Input:** `hello`, `world`

---

### 🔡 **Only Alphabets**

Removes digits and symbols, allowing only alphabetic input.

```dart
/// Example:
TextField(
  inputFormatters: [OnlyAlphabetsFormatter()],
)
```

**Input:** `abc123@#` → **Output:** `abc`

---

### 🐫 **CamelCase Formatter**

Converts the input to camelCase format.

```dart
/// Example:
TextField(
  inputFormatters: [CamelCaseInputFormatter()],
)
```

**Input:** `hello world flutter` → **Output:** `helloWorldFlutter`

---

### 🐍 **Snake_case Formatter**

Automatically formats input to `snake_case`.

```dart
/// Example:
TextField(
  inputFormatters: [SnakeCaseInputFormatter()],
)
```

**Input:** `hello world` → **Output:** `hello_world`

---

### ➖ **Kebab-case Formatter**

Automatically formats input to `kebab-case`.

```dart
/// Example:
TextField(
  inputFormatters: [KebabCaseInputFormatter()],
)
```

**Input:** `hello world` → **Output:** `hello-world`

---

### ➕ **Replace Whitespace With Underscores**

Replaces all spaces with underscores.

```dart
/// Example:
TextField(
  inputFormatters: [WhitespaceToUnderscoreFormatter()],
)
```

**Input:** `hello world flutter` → **Output:** `hello_world_flutter`

---

### 🚫 **Prevent Multiple Consecutive Spaces**

Ensures no more than one space between words.

```dart
/// Example:
TextField(
  inputFormatters: [SingleSpaceFormatter()],
)
```

**Input:** `hello   world` → **Output:** `hello world`

## 👨‍💻 Maintainer

Developed with 💙 by [Katayath Sai Kiran](https://github.com/Katayath-Sai-Kiran)
📬 Feel free to contribute or suggest improvements!

