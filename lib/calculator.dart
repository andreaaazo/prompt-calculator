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
