import 'package:flutterando_tests/stream.dart';
import 'package:test/test.dart';

void main() {
  test('Should finishe the request receiving a list of string', () async {
    final stream = getStreamList();
    expect(stream, emitsInOrder(['masterclass', 'flutterando']));
  });
}
