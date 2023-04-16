import 'dart:io';

class Calculator {
  static final Map<int, String> mathOperations = {
    1: "Addition",
    2: "Multiplication",
    3: "Division",
    4: "Exit",
  };
  String? selectedMathOperation;
  List<int> numbers = [];

  Calculator() {
    print("""
>                                                     ___
>                                                 .-='   )
>                               ---===(##]XXXXXXXXXXX>=- <
>                                                 `-=.___)
> 
> ██████╗  █████╗ ██████╗ ████████╗██╗   ██╗██╗      █████╗ ████████╗ ██████╗ ██████╗ 
> ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║   ██║██║     ██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
> ██║  ██║███████║██████╔╝   ██║   ██║   ██║██║     ███████║   ██║   ██║   ██║██████╔╝
> ██║  ██║██╔══██║██╔══██╗   ██║   ██║   ██║██║     ██╔══██║   ██║   ██║   ██║██╔══██╗
> ██████╔╝██║  ██║██║  ██║   ██║   ╚██████╔╝███████╗██║  ██║   ██║   ╚██████╔╝██║  ██║
> ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
>                                                                           
>                                 by @andreaaa.zo                                   
>""");
  }

  String? getOperator() {
    stdout.write("""
> -------------------------------------------------------------------------------------
> What kind of operation would you like to perform?
> 1) Addition (+)
> 2) Multiplication (*)
> 3) Division (/)
> 
> 4) Exit
> 
> Enter your choice:
\$ """);

    final int? input = int.tryParse(stdin.readLineSync()!);

    // Check if the value inserted is valid
    if (input == null || input < 0 || input > mathOperations.length) {
      throw ArgumentError("Insert a valid number");
    }

    selectedMathOperation = mathOperations[input];
    print("> $selectedMathOperation selected");
    return selectedMathOperation;
  }

  List<num> getNumbers() {
    stdout.write("""
> 
> Insert numbers adding a ',' between each number and the next one: 
\$ """);

    final List<String> input = (stdin.readLineSync()!).split(',');
    numbers.clear();

    for (final part in input) {
      final trimmedPart = part.trim();
      final int? number = int.tryParse(trimmedPart);

      if (number == null) {
        throw FormatException("Invalid number: '$trimmedPart'");
      }

      numbers.add(number);
    }

    print("> Selected numbers: ${numbers.join(' ')}");

    return numbers;
  }

  num calculate() {
    if (selectedMathOperation == null || numbers.isEmpty) {
      throw FormatException(
          "Before calculating, please enter the numbers and the operation you would like to perform");
    }

    switch (selectedMathOperation) {
      case "Addition":
        num result = numbers.reduce((a, b) => a + b);
        print(">\n> Your result: $result\n>");
        return result;

      case "Multiplication":
        num result = numbers.reduce((a, b) => a * b);
        print(">\n> Your result: $result\n>");
        return result;

      case "Division":
        if (numbers.length < 2) {
          throw FormatException("Division requires at least two numbers");
        }
        if (numbers.contains(0)) {
          throw FormatException("Cannot divide by zero");
        }
        num result = numbers.reduce((a, b) => a ~/ b.toInt());
        print(">\n> Your result: $result\n>");
        return result;

      default:
        throw FormatException("Invalid operation");
    }
  }

  void serveForever() {
    while (true) {
      if (selectedMathOperation == "Exit") {
        break;
      }
      getOperator();
      if (selectedMathOperation == "Exit") {
        break;
      }
      getNumbers();
      calculate();
    }
  }
}
