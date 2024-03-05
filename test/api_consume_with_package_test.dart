import 'package:flutterando_tests/api_consume.dart';
import 'package:flutterando_tests/models/product.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}

class ResponseMock extends Mock implements Response {}

void main() {
  test('Should return a list of products', () async {
    final uno = UnoMock();
    final response = ResponseMock();
    when(() => response.data).thenReturn(productListJson);
    when(() => uno.get(any())).thenAnswer((invocation) async => response);
    final service = ApiService(uno);

    expect(
        service.getProducts(),
        completion([
          Product(id: 1, title: 'Bruh01', price: 12.0),
          Product(id: 2, title: 'Bruh02', price: 15.0),
        ]));
  });

  test('Should return a empty list', () async {
    final uno = UnoMock();
    final service = ApiService(uno);
    when(() => uno.get(any())).thenThrow(UnoError('error'));

    expect(service.getProducts(), completion([]));
  });
}

final productListJson = [
  {
    'id': 1,
    'title': 'Bruh01',
    'price': 12.0,
  },
  {
    'id': 2,
    'title': 'Bruh02',
    'price': 15.0,
  }
];
