import 'package:calculator/ui.dart';
import 'package:calculator/user_input.dart';
import 'package:calculator/calculator_logic.dart';

/// The Calculator class orchestrates the calculator application, managing user input
/// and mathematical operations with clarity and performance.
class Calculator {
  double? numOne;
  double? numTwo;
  int? operation;
  double? result;

  /// Initiates the calculator application, presenting a warm welcome and handling
  /// user interactions for mathematical operations and number inputs.
  ///
  /// Persistent until the user gracefully decides to exit (option 4).
  void run() {
    UI.welcome();

    do {
      operationSelection();
      if (operation == 4) {
        break;
      }
      numberSelection("one");
      numberSelection("two");

      result = performOperation();

      UI.result(result!);
    } while (operation != 4);
  }

  /// Facilitates the user's choice of a mathematical operation.
  ///
  /// Presents a well-crafted menu, captures, and validates the user's selection.
  void operationSelection() {
    UI.selectOperation();
    operation = UserInput.getAndValidateOperation();
  }

  /// Guides the user in selecting a numerical value.
  ///
  /// Requires a [numberType] parameter specifying the type of number being selected.
  /// Presents a prompt, captures, and validates the user's input accordingly.
  void numberSelection(String numberType) {
    UI.selectNumber(numberType);
    if (numberType == "one") {
      numOne = UserInput.getAndValidateNumber();
    } else if (numberType == "two") {
      numTwo = UserInput.getAndValidateNumber();
    }
  }

  /// Performs the selected mathematical operation.
  ///
  /// Uses the [operation] and operands [numOne] and [numTwo] to calculate the result.
  double performOperation() {
    switch (operation) {
      case 1:
        return CalculatorLogic.add(numOne!, numTwo!);
      case 2:
        return CalculatorLogic.multiply(numOne!, numTwo!);
      case 3:
        return CalculatorLogic.divide(numOne!, numTwo!);
      default:
        throw Exception("Operator not defined");
    }
  }
}
