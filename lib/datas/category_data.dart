
class CategoryData {
  int id;
  String desc;
  String image;

  CategoryData(Map category) {
    id    = category["id"];
    desc = category["descricao"];
    image  = category["urlImagem"];
  }
}