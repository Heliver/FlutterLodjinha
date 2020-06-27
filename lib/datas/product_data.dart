
class ProductData {
  int id;
  String name;
  String image;
  String desc;
  var oldPrice;
  var newPrice;
  Map<String, dynamic> category;

  ProductData(Map product) {
    id = product["id"];
    name = product["nome"];
    image = product["urlImagem"];
    desc = product["descricao"];
    oldPrice = product["precoDe"];
    newPrice = product["precoPor"];
    category = {
      'id': product["categoria"]["id"],
      'categoryDesc': product["categoria"]["descricao"],
      'categoryImg': product["categoria"]["urlImagem"]
    };
  }
}
