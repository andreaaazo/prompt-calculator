import "package:calculator/calculator.dart";

void main() {
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

  bool continueCalc = true;

  while (continueCalc) {
    int operator = getOperator();
    List<num> numbers = getNumbers();

    switch (operator) {
      case 1:
        printResult(addition(numbers));
        break;
      case 2:
        printResult(moltiplication(numbers));
        break;
      case 3:
        printResult(division(numbers));
        break;
      case 4:
        continueCalc = false;
        break;
    }

    continueCalc = false;
  }
}
