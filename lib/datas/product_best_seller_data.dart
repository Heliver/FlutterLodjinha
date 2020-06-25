import 'package:flutter/material.dart';

class ProductBestSellerData {
  int id;
  String name;
  String image;
  String desc;
  var oldPrice;
  var newPrice;
  Map<String, dynamic> category;

  ProductBestSellerData(Map bestSeller) {
    id = bestSeller["id"];
    name = bestSeller["nome"];
    image = bestSeller["urlImagem"];
    desc = bestSeller["descricao"];
    oldPrice = bestSeller["precoDe"];
    newPrice = bestSeller["precoPor"];
    category = {
      'id': bestSeller["categoria"]["id"],
      'categoryDesc': bestSeller["categoria"]["descricao"],
      'categoryImg': bestSeller["categoria"]["urlImagem"]
    };
  }
}
