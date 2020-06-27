import 'package:flutter/material.dart';
import 'package:lodjinha/datas/product_data.dart';
import 'package:lodjinha/services/product_service.dart';
import 'package:lodjinha/tiles/category_tile.dart';

// ignore: must_be_immutable
class CustomBestSeller extends StatelessWidget {
  var productService = ProductService();
  var dividedTiles;
  String title = "";
  ProductData _product;
  AsyncSnapshot snapshot;

  CustomBestSeller(this.snapshot, this.title) {

        dividedTiles = ListTile.divideTiles(
            tiles: snapshot.data["data"].map<CategoryTile>((doc) {
              _product = ProductData(doc);
              return CategoryTile(_product);
            }).toList(),
            color: Colors.grey[500])
        .toList();

  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Material(
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    title != ""
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 0.0),
                            child: Text(
                              "Mais Vendidos",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 74, 74, 74),
                              ),
                            ),
                          )
                        : Material(),
                    title != "" ? Divider(thickness: 1) : Material(),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      height: MediaQuery.of(context).size.height / 1.15,
                      child: Center(
                        child: ListView(
                            shrinkWrap: false,
                            padding: const EdgeInsets.all(0.0),
                            children: dividedTiles),
                      )
                    )
                  ],
                )));
  }
}
