/// The UI class provides static methods for displaying user interface elements.
class UI {
  /// Displays a welcome message with an ASCII art.
  static void welcome() {
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

  /// Displays options for selecting a mathematical operation.
  static void selectOperation() {
    print("""
> -------------------------------------------------------------------------------------
> What kind of operation would you like to perform?
> 1) Addition (+)
> 2) Multiplication (*)
> 3) Division (/)
> 
> 4) Exit
> 
> Select:""");
  }

  /// Displays a prompt for selecting a number.
  ///
  /// Takes a [number] parameter for indicating which number is being selected.
  static selectNumber(String number) {
    print("> Select number $number: ");
  }

  /// Displays the result of a mathematical operation.
  ///
  /// Takes a [result] parameter for displaying the calculated result.
  static result(double result) {
    print("> Your result: $result");
  }
}
