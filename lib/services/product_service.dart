import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {

  final String _baseUrl = "https://alodjinha.herokuapp.com/produto";

  Future<Map> getProductList(int category) async {
    http.Response response;
    response = await http.get("$_baseUrl?categoriaId=$category");

    return json.decode(response.body);
  }

  Future<Map> getBestSeller() async {
    http.Response response;
    response = await http.get("$_baseUrl/maisvendidos");

    return json.decode(response.body);
  }

  Future<Map> reservationProduct(int productId) async {
    http.Response response;
    response = await http.post(
        "$_baseUrl/$productId",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );

    if (response.statusCode == 200) {
        return json.decode(response.body);
    } else {
       throw Exception('Falha para reservar Item');
    }
  }

}