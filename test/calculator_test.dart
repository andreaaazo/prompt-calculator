import 'package:test/test.dart';
import 'package:calculator/calculator.dart';

/// Unit tests for the [Calculator] class, covering logical, performance, and time efficiency scenarios.
void main() {
  group('Calculator', () {
    late Calculator calculator;

    setUp(() {
      calculator = Calculator();
    });

    // Logical Tests
    test('Performs addition correctly', () {
      calculator.operation = 1;
      calculator.numOne = 5;
      calculator.numTwo = 3;
      double result = calculator.performOperation();
      expect(result, equals(8));
    });

    test('Performs multiplication correctly', () {
      calculator.operation = 2;
      calculator.numOne = 5;
      calculator.numTwo = 3;
      double result = calculator.performOperation();
      expect(result, equals(15));
    });

    test('Performs division correctly', () {
      calculator.operation = 3;
      calculator.numOne = 15;
      calculator.numTwo = 3;
      double result = calculator.performOperation();
      expect(result, equals(5));
    });

    test('Handles invalid operator', () {
      calculator.operation = 5;
      calculator.numOne = 10;
      calculator.numTwo = 2;
      expect(() => calculator.performOperation(), throwsException);
    });

    // Performance Tests
    test('Handles large addition efficiently', () {
      calculator.operation = 1;
      calculator.numOne = 1e15;
      calculator.numTwo = 1e14;
      expect(() => calculator.performOperation(), isNot(throwsException));
    });

    test('Handles large multiplication efficiently', () {
      calculator.operation = 2;
      calculator.numOne = 1e10;
      calculator.numTwo = 1e5;
      expect(() => calculator.performOperation(), isNot(throwsException));
    });

    test('Handles division efficiently', () {
      calculator.operation = 3;
      calculator.numOne = 1e15;
      calculator.numTwo = 1e5;
      expect(() => calculator.performOperation(), isNot(throwsException));
    });

    // Time Efficiency Tests
    test('Takes reasonable time for repeated calculations', () {
      calculator.operation = 1;
      calculator.numOne = 5;
      calculator.numTwo = 3;

      Stopwatch stopwatch = Stopwatch()..start();
      for (int i = 0; i < 10000000; i++) {
        calculator.performOperation();
      }
      stopwatch.stop();

      print(
          'Elapsed time: ${stopwatch.elapsedMilliseconds} ms for 10000000 operations.');
      expect(stopwatch.elapsedMilliseconds, lessThan(1000));
    });
  });
}
