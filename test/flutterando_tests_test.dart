import 'package:flutterando_tests/flutterando_tests.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => null);
  tearDown(() => null);
  setUpAll(() => null);
  tearDownAll(() => null);
  test('Should calculate IMC', () {
    // arrange
    final height = 1.78;
    final weight = 75.0;
    // act
    final result = calculateImc(height: height, weight: weight);
    // assert
    expect(result, equals(23.671253629592222));
    expect(result, isA<double>());
    expect(result, greaterThan(20));
    expect(result, isPositive);
    expect(result.toString(), matches(RegExp(r'\d')));
  });

  group(
    'Param\'s Exception |',
    () => {
      test('ERROR: height must be higher than 0', () {
        expect(
          () => calculateImc(height: 0, weight: 75),
          throwsA(
            isA<Exception>(),
          ),
        );
      }),
      test(
        'ERROR: weight must be weight than 0',
        () {
          expect(
            () => calculateImc(height: 1.78, weight: 0),
            throwsA(
              isA<Exception>(),
            ),
          );
        },
      ),
    },
  );
}
