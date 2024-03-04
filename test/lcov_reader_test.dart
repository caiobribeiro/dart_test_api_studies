import 'package:flutterando_tests/lcov_reader.dart';
import 'package:test/test.dart';

void main() {
  test('Should get coverage porcentage', () async {
    final result = coverage(lcovPath: './coverage/lcov.info');
    expect(result, '100%');
  });
}
