import 'package:flutterando_tests/lcov_reader.dart';
import 'package:flutterando_tests/models/line_report.dart';
import 'package:test/test.dart';

void main() {
  test('Should get coverage porcentage', () async {
    final result = coverage(lcovPath: './coverage/lcov.info');
    expect(result, '100%');
  });

  test('Should calculate 50% percentage', () async {
    final result = calculatePercent([
      LineReport(sourceFile: 'a', lineFound: 10, lineHit: 5),
      LineReport(sourceFile: 'b', lineFound: 18, lineHit: 9),
    ]);
    expect(result, 50);
  });
}
