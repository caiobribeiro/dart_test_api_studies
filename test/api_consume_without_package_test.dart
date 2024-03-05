import 'dart:async';

import 'package:flutterando_tests/api_consume_package.dart';
import 'package:flutterando_tests/models/product.dart';
import 'package:test/test.dart';
import 'package:uno/uno.dart';

class UnoMock implements Uno {
  final bool withError;

  UnoMock([this.withError = false]);

  @override
  Future<Response> get(String url,
      {Duration? timeout,
      Map<String, String> params = const {},
      Map<String, String> headers = const {},
      ResponseType responseType = ResponseType.json,
      DownloadCallback? onDownloadProgress,
      ValidateCallback? validateStatus}) async {
    if (withError) {
      throw UnoError('error');
    }
    return Response(
      headers: headers,
      request: Request(
        headers: {},
        method: '',
        timeout: Duration.zero,
        uri: Uri.base,
      ),
      status: 200,
      data: productListJson,
    );
  }

  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  test('Should return a list of products', () async {
    final uno = UnoMock();
    final service = ApiService(uno);

    expect(
        service.getProducts(),
        completion([
          Product(id: 1, title: 'Bruh01', price: 12.0),
          Product(id: 2, title: 'Bruh02', price: 15.0),
        ]));
  });

  test('Should return a empty list', () async {
    final uno = UnoMock(true);
    final service = ApiService(uno);

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
