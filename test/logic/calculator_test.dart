import 'package:flutter_test/flutter_test.dart';
import 'package:validation/logic/calculator.dart';

void main() {
  late Calculator calc;

  setUpAll(() {
    calc = Calculator();
  });

  tearDownAll(() {
    prints("Finish testing");
  });

  group("Test Caculator", () {
    test("add function", () {
      int result = calc.add(2, 3);

      expect(result, 5);
    });

    test("sub function", () {
      var result = calc.sub(7, 4);

      expect(result, 3);
    });

    test("multition function", () {
      var result = calc.mul(3, 5);

      expect(result, 15);
      expect(result, isNot(12));
    });

    test("div function", () {
      var result = calc.div(12, 4);

      expect(result, 3);
    });
  });
}
