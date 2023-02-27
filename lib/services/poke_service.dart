import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/poke_model.dart';

class PokeService {
  PokeService._();

  static Future<List<PokeItemModel>> pokeData({int offset = 0, int limit = 20}) async {
    final Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=$offset&limit=$limit');
    http.Response res = await http.get(url);
    try {
      switch (res.statusCode) {
        case 200:
          final decode = jsonDecode(res.body);
          return PokeModel.fromJson(decode).results;
        default:
          throw Exception(res.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
