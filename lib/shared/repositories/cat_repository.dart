import 'dart:typed_data';

import 'package:http/http.dart' as http;

abstract class CatRepository {
  Future<Uint8List> fetch(int statusCode);
}

final class CatRepositoryImpl extends CatRepository {
  final http.Client _client;

  CatRepositoryImpl(this._client);

  @override
  Future<Uint8List> fetch(int statusCode) async {
    final response = await _client.get(
      Uri.parse('https://http.cat/images/$statusCode.jpg'),
    );

    return response.bodyBytes;
  }
}
