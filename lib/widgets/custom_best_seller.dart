import 'package:flutter/material.dart';
import 'package:lodjinha/datas/product_best_seller_data.dart';
import 'package:lodjinha/services/product_service.dart';
import 'package:lodjinha/tiles/category_tile.dart';

class CustomBestSeller extends StatelessWidget {
  var productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productService.getBestSeller(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SliverToBoxAdapter(
            child: Container(
              height: 50.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            ),
          );
        } else {
          var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data["data"].map<CategoryTile>((doc) {
                    ProductBestSellerData bestSeller =
                        ProductBestSellerData(doc);
                    return CategoryTile(bestSeller);
                  }).toList(),
                  color: Colors.grey[500])
              .toList();

          return SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  "Mais Vendidos",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 74, 74, 74),
                  ),
                ),
              ),
              Divider(thickness: 1),
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                height: 225,
                child: ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: dividedTiles
                ),
              )
            ],
          ));
        }
      },
    );
  }
}
