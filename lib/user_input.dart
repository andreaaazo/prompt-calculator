import 'dart:io';

/// The UserInput class provides methods for obtaining and validating user input.
class UserInput {
  /// Holds the user input obtained from stdin.
  static String userInput = "";

  /// Reads a line from stdin and sets it as the user input.
  static void getUserInput() {
    stdout.write("> ");
    userInput = stdin.readLineSync()!;
  }

  /// Gets and validates the selected mathematical operation.
  ///
  /// Returns an integer representing the selected operation:
  /// - 1: Addition (+)
  /// - 2: Multiplication (*)
  /// - 3: Division (/)
  /// - 4: Exit
  static int getAndValidateOperation() {
    do {
      getUserInput();
      if (!_validateOperation()) {
        printError("Number exceeds menu options. Provide a correct option.");
      }
    } while (!_validateOperation());

    return int.parse(userInput);
  }

  /// Validates the entered operation number.
  ///
  /// Returns `true` if the entered number is within the valid menu options.
  static bool _validateOperation() {
    return ["1", "2", "3", "4"].contains(userInput);
  }

  /// Prints an error message to the console.
  ///
  /// Takes a [message] parameter indicating the error message to be displayed.
  static void printError(String message) {
    print("Error: $message");
  }

  /// Validates the entered number.
  ///
  /// Returns `true` if the entered number is a valid double.
  static bool _validateNumber() {
    return double.tryParse(userInput) is double;
  }

  /// Gets and validates a numerical input from the user.
  ///
  /// Returns a double representing the validated numerical input.
  static double getAndValidateNumber() {
    do {
      getUserInput();
      if (!_validateNumber()) {
        printError("Invalid number. Provide a valid number.");
      }
    } while (!_validateNumber());

    return double.parse(userInput);
  }
}
