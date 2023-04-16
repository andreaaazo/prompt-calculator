import 'package:test/test.dart';
import 'package:calculator/calculator.dart';

void main() {
  group('Calculator tests', () {
    late Calculator calculator;

    setUp(() {
      calculator = Calculator();
    });

    test('Selected operator is valid', () {
      calculator.selectedMathOperation = "Addition";
      expect(calculator.selectedMathOperation, equals("Addition"));
    });

    test('Selected operator is invalid', () {
      calculator.selectedMathOperation = "Invalid operator";
      expect(() => calculator.calculate(),
          throwsA(TypeMatcher<FormatException>()));
    });

    test('Division by zero', () {
      calculator.selectedMathOperation = "Division";
      calculator.numbers = [5, 0];
      expect(() => calculator.calculate(),
          throwsA(TypeMatcher<FormatException>()));
    });

    test('Valid addition', () {
      calculator.selectedMathOperation = "Addition";
      calculator.numbers = [1, 2, 3];
      expect(calculator.calculate(), equals(6));
    });

    test('Valid multiplication', () {
      calculator.selectedMathOperation = "Multiplication";
      calculator.numbers = [2, 3, 4];
      expect(calculator.calculate(), equals(24));
    });

    test('Valid division', () {
      calculator.selectedMathOperation = "Division";
      calculator.numbers = [20, 4, 2];
      expect(calculator.calculate(), equals(2));
    });

    test('Not enough numbers for division', () {
      calculator.selectedMathOperation = "Division";
      calculator.numbers = [20];
      expect(() => calculator.calculate(),
          throwsA(TypeMatcher<FormatException>()));
    });

    test('Valid exit', () {
      calculator.selectedMathOperation = "Exit";
      expect(() => calculator.serveForever(), returnsNormally);
    });
  });
}
