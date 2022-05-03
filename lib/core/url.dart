import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

/*void PegarUrl() async {
  var response = await http.get(Uri.parse(
      "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=2af16d589d9800df6df6653920d7bd6e&hash=78892009634f24b4a4094d01dd7012f6"));
}*/

var baseUrl = Uri.parse("https://jsonplaceholder.typicode.com/users.json");

class API {
  static Future getUsers() async {
    return await http.get(baseUrl);
  }
}
