import 'package:flutter/material.dart';
import 'package:lodjinha/datas/category_data.dart';
import 'package:lodjinha/services/category_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCategory extends StatelessWidget {
  var categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categoryService.getCategories(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              ),
            );
          } else {
            return SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      "Categorias",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 74, 74, 74),
                      ),
                    ),
                  ),
                  Divider(thickness: 1),
                  Container(
                      padding: EdgeInsets.all(0.0),
                      height: 90,
                      child: Center(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data["data"].map<Center>((item) {
                              CategoryData category = CategoryData(item);
                              return Center(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        width: 50.0,
                                        imageUrl: category.image,
                                        errorWidget: (context, url, error) =>
                                            Image.asset("images/not_found.png",
                                                width: 50.0),
                                      ),
                                    ),
                                    Container(
                                      width: 80.0,
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        category.desc,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                      )
                    ),
                ],
              ),
            );
          }
        });
  }
}
