import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {

  final String _baseUrl = "https://alodjinha.herokuapp.com/produto";

  Future<Map> getBestSeller() async {
    http.Response response;
    response = await http.get("$_baseUrl/maisvendidos");

    return json.decode(response.body);
  }
}