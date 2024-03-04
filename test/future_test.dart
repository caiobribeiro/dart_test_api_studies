import 'package:flutterando_tests/future.dart';
import 'package:test/test.dart';

void main() {
  test('Should finishe the request returning a list of string', () async {
    final future = getFutureList();
    expect(future, completes);
    expect(future, completion(isA<List<String>>()));
    expect(future, completion(equals(['masterclass', 'flutterando'])));
  });
}
