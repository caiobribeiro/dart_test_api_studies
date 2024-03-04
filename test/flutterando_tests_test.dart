import 'package:flutterando_tests/flutterando_tests.dart';
import 'package:test/test.dart';

void main() {
  test('Should calculate IMC', () {
    final result = calculateImc(height: 1.78, weight: 75);
    expect(result, 23.671253629592222);
  });

  test('ERROR: height must be higher than 0', () {
    expect(
      () => calculateImc(height: 0, weight: 75),
      throwsA(
        isA<Exception>(),
      ),
    );
  });

  test('ERROR: weight must be weight than 0', () {
    expect(
      () => calculateImc(height: 1.78, weight: 0),
      throwsA(
        isA<Exception>(),
      ),
    );
  });
}
