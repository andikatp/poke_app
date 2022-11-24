import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:poke_app/models/poke_model.dart';

class PokeService {
  //fetching data from api
  static Future<List<Result>> fetchData() async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon');
    final http.Response response = await http.get(url);
    try {
      switch (response.statusCode) {
        case 200:
          final decode = jsonDecode(response.body);
          return Welcome.fromJson(decode).results ?? [];
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
