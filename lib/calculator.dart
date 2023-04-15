import 'dart:io';

int getOperator() {
  print("""
What kind of operation would you like to perform?
1) Addition (+)
2) Multiplication (*)
3) Division (/)

4) Exit

""");
  stdout.writeln("Enter your choice:");
  var input = stdin.readLineSync();
  if (input == null) {
    return 0;
  } else {
    return int.parse(input);
  }
}

List<num> getNumbers() {
  stdout.writeln("""
                                                      
█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗        
╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝        
                                                                                              
███╗   ██╗██╗   ██╗███╗   ███╗██████╗ ███████╗██████╗ ███████╗
████╗  ██║██║   ██║████╗ ████║██╔══██╗██╔════╝██╔══██╗██╔════╝
██╔██╗ ██║██║   ██║██╔████╔██║██████╔╝█████╗  ██████╔╝███████╗
██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══██╗██╔══╝  ██╔══██╗╚════██║
██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██████╔╝███████╗██║  ██║███████║
╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝
                                                                                             
Once finished to insert numbers press "Enter" to calculate""");

  bool continueGetNumbers = true;

  List<num> numbers = [];

  while (continueGetNumbers) {
    stdout.writeln("""

Enter one number:""");

    var input = stdin.readLineSync()!;

    if (input == "") {
      continueGetNumbers = false;
    } else {
      // Handle invalid numbers with FormatException
      try {
        // Add to list in num type
        numbers.add(num.parse(input));
      } on FormatException {
        print("ERROR: INSERT A VALID NUMBER");
      }
    }
  }

  return numbers;
}

num addition(List<num> numbers) {
  num total = 0;

  for (var number in numbers) {
    total += number;
  }

  return total;
}

void printResult(num result) {
  stdout.writeln("""

█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗    
╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝

██████╗ ███████╗███████╗██╗   ██╗██╗  ████████╗
██╔══██╗██╔════╝██╔════╝██║   ██║██║  ╚══██╔══╝
██████╔╝█████╗  ███████╗██║   ██║██║     ██║   
██╔══██╗██╔══╝  ╚════██║██║   ██║██║     ██║   
██║  ██║███████╗███████║╚██████╔╝███████╗██║   
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚══════╝╚═╝

$result
""");
}

num moltiplication(List<num> numbers) {
  num total = 1;

  for (var number in numbers) {
    total = total * number;
  }

  return total;
}

num division(List<num> numbers) {
  num total = numbers[0];

  for (var i = 1; i < numbers.length; i++) {
    total = total / numbers[i];
  }

  return total;
}

class Calculator {
  Map mathOperations = {1: "Addition", 2: "Multiplication", 3: "Division"};
  String? selectedMathOperation;
  List<int>? numbers;

  Calculator() {
    print("""
                                                    ___
                                                .-='   )
                              ---===(##]XXXXXXXXXXX>=- <
                                                `-=.___)

██████╗  █████╗ ██████╗ ████████╗██╗   ██╗██╗      █████╗ ████████╗ ██████╗ ██████╗ 
██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║   ██║██║     ██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
██║  ██║███████║██████╔╝   ██║   ██║   ██║██║     ███████║   ██║   ██║   ██║██████╔╝
██║  ██║██╔══██║██╔══██╗   ██║   ██║   ██║██║     ██╔══██║   ██║   ██║   ██║██╔══██╗
██████╔╝██║  ██║██║  ██║   ██║   ╚██████╔╝███████╗██║  ██║   ██║   ╚██████╔╝██║  ██║
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                                                          
                                by @andreaaa.zo                                   
------------------------------------------------------------------------------------
  """);
  }

  String? getOperator() {
    stdout.writeln("""
What kind of operation would you like to perform?
1) Addition (+)
2) Multiplication (*)
3) Division (/)

Enter your choice:""");

    final int? input = int.tryParse(stdin.readLineSync()!);

    // Check if the value inserted is valid
    if (input == null || input < 0 || input > mathOperations.length) {
      throw ArgumentError("Insert a valid number");
    }

    selectedMathOperation = mathOperations[input];
    print("$selectedMathOperation selected");
    return selectedMathOperation;
  }

  List<num> getNumbers() {
    stdout.writeln(
        "Insert numbers adding a space between each number and the next one: ");

    final List<String> input = (stdin.readLineSync()!).split(',');
    final numbers = <int>[];

    for (final part in input) {
      final trimmedPart = part.trim();
      final int? number = int.tryParse(trimmedPart);

      if (number == null) {
        throw FormatException("Invalid number: '$trimmedPart'");
      }

      numbers.add(number);
    }

    print("Selected numbers: ${numbers.join(' ')}");

    return numbers;
  }

  num calculate() {
    if (selectedMathOperation == null || numbers == null) {
      throw FormatException(
          "Before to calculate, you have to insert the numbers and the operation you would like to do");
    }
    return 1;
  }
}
