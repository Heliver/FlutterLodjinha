import 'package:http/http.dart' as http;
import 'dart:convert';

class BannerService {
  final String _baseUrl = "https://alodjinha.herokuapp.com/banner";

  Future<Map> getBanner() async {
    http.Response response;
    response = await http.get(_baseUrl);

    return json.decode(response.body);
  }
}
