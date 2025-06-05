
<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/advanced_text_input_formatters_codespark/main/assets/banner.png" alt="Banner"/>

# ✨ Advanced Text Input Formatters — CodeSpark

A collection of custom `TextInputFormatter`s and helper utilities designed to enhance and control user input in Flutter apps. Each formatter is easy to plug into your `TextField` or `TextFormField`, and most come with clean utility methods for validation and behavior tuning.


## 🔐 PAN Card Input Formatter (Smart Keyboard Switch)

Enforces Indian PAN card format: `ABCDE1234F`  
✔️ Automatically uppercases letters  
✔️ Dynamically switches keyboard type (`text → number → text`)  
✔️ Optional validator provided

```dart
final TextEditingController _controller = TextEditingController();
final keyboardType = PanCardInputHelper.getKeyboardType(_controller.text);

TextFormField(
  key: ValueKey(keyboardType), // Forces rebuild to change keyboard
  controller: _controller,
  decoration: const InputDecoration(
    labelText: 'Enter PAN Card Number',
    border: OutlineInputBorder(),
  ),
  autofocus: true,
  keyboardType: keyboardType,
  inputFormatters: [PanCardInputHelper.formatter],
  validator: (val) => PanCardInputHelper.validate(val ?? ''),
  onChanged: (value) => setState(() {}), // Required to trigger rebuild
);
````


## 🧠 Formatters Included

### ⌛ **Typing Delay Formatter**

Mimics human-like typing latency by simulating delayed input.

```dart
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


### 🔢 **Digits Only Formatter**

Allows only numeric digits (0–9).

```dart
TextField(
  inputFormatters: [DigitsOnlyFormatter()],
)
```


### 🔁 **Input Mirror Formatter**

Reverses the text as you type.
**Input:** `hello` → **Output:** `olleh`

```dart
TextField(
  inputFormatters: [InputMirrorFormatter()],
)
```


### 🚫 **Prevent Repeat Characters**

Blocks immediate duplicate characters.
**Input:** `aaabbb` → **Output:** `ab`

```dart
TextField(
  inputFormatters: [PreventRepeatCharactersFormatter()],
)
```


### ✂️ **Block Clipboard Access**

Disables pasting into the field.

```dart
TextField(
  inputFormatters: [BlockClipboardFormatter()],
)
```


### 🪞 **Only Palindromes Allowed**

Allows only valid palindromes.

```dart
TextField(
  inputFormatters: [PalindromeOnlyFormatter()],
)
```

**Allowed:** `madam`, `racecar`
**Blocked:** `hello`


### 🔡 **Only Alphabets**

Strips everything but A–Z and a–z.

```dart
TextField(
  inputFormatters: [OnlyAlphabetsFormatter()],
)
```

**Input:** `abc123@#` → **Output:** `abc`


### 🐫 **CamelCase Formatter**

Converts input to camelCase.

```dart
TextField(
  inputFormatters: [CamelCaseInputFormatter()],
)
```

**Input:** `hello world` → **Output:** `helloWorld`


### 🐍 **Snake\_case Formatter**

Formats input as `snake_case`.

```dart
TextField(
  inputFormatters: [SnakeCaseInputFormatter()],
)
```

**Input:** `hello world` → **Output:** `hello_world`


### ➖ **Kebab-case Formatter**

Formats input as `kebab-case`.

```dart
TextField(
  inputFormatters: [KebabCaseInputFormatter()],
)
```

**Input:** `hello world` → **Output:** `hello-world`


### ➕ **Replace Whitespace With Underscores**

Replaces all spaces with underscores.

```dart
TextField(
  inputFormatters: [WhitespaceToUnderscoreFormatter()],
)
```

**Input:** `hello world flutter` → **Output:** `hello_world_flutter`


### 🚫 **Prevent Multiple Consecutive Spaces**

Ensures only a single space between words.

```dart
TextField(
  inputFormatters: [SingleSpaceFormatter()],
)
```

**Input:** `hello   world` → **Output:** `hello world`


## 🧪 Usage Tips

* Combine multiple formatters for strict control.
* Use `.validate()` utilities where available.
* Attach `TextEditingController` listeners to detect changes in real-time.
* Add a `ValueKey` when dynamically changing keyboardType (e.g. PAN formatter).


## 👨‍💻 Maintainer

Made with 💙 by [Katayath Sai Kiran](https://github.com/Katayath-Sai-Kiran)
📬 Contributions, stars, and suggestions welcome!





