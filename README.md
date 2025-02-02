# PhoneticCLI

PhoneticCLI is a sleek command-line tool that harnesses the magic of [PhoneticTextSwift](https://github.com/dan-hart/PhoneticTextSwift.git) to convert text into its phonetic representation and even reverse that conversion back to the original. Whether you're deciphering a quirky license plate or just playing with words, this CLI makes it fun and effortless.

## Features

- **Convert Text:** Transform any string into a clear, spoken-out-loud phonetic version.
- **Reverse Conversion:** Reconstruct the original text from its phonetic form.
- **Sensible Defaults:** By default, the CLI uses case prefixing (i.e. "Capital" or "lowercase"), a newline (`\n`) delimiter, and new line output.
- **Global Installation:** Easily install the CLI so you can run the command from anywhere.
- **Built with Swift 6:** Enjoy the latest Swift language features.
- **Swift Package Manager:** Easily integrate into your projects.

## Installation

You can add PhoneticCLI as a dependency in your Swift Package Manager project or clone this repository and build it locally.

To build locally, run:

```bash
swift build -c release
```

## Global Installation

Then, copy the resulting binary to a directory in your PATH (for example, /usr/local/bin):
```bash
sudo cp .build/release/PhoneticCLI /usr/local/bin/phonetic
```

## Usage
After building, run the CLI from your terminal. Here are some examples:

### Converting Text to Phonetic Form

Convert the string xCBDeDe93;dDsQ with case prefixing enabled, newline output, and default delimiter:
```bash
phonetic convert "someString"
```

Example Output:
```
x: lowercase xray
C: Capital Charlie
B: Capital Bravo
D: Capital Delta
e: lowercase echo
D: Capital Delta
e: lowercase echo
9: Nine
3: Three
; Semicolon
d: lowercase delta
D: Capital Delta
s: lowercase sierra
Q: Capital Quebec
STOP
```

### Reversing Phonetic Text

Reverse a phonetic string back to its original text. For example, if you have a phonetic string where “SPACE” represents a space:
```bash
phonetic reverse "SPACE\nA: Capital Alpha\nb: lowercase bravoSPACE\nSTOP"
```

Example Output:
```
" Ab "
```

## Contributing

Contributions are warmly welcome! If you’ve got improvements or spicy ideas to enhance PhoneticCLI, fork the repository and send a pull request.

## License

This project is released under the GNU GPL v3 [LICENSE](LICENSE).
