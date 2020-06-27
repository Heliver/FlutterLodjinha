import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryService {

  final String _baseUrl = "https://alodjinha.herokuapp.com/categoria";

  Future<Map> getCategories() async {
    http.Response response;
    response = await http.get(_baseUrl);

    return json.decode(response.body);
  }
}