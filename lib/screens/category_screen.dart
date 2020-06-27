import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lodjinha/datas/category_data.dart';
import 'package:lodjinha/services/product_service.dart';
import 'package:lodjinha/widgets/custom_best_seller.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  ProductService productService = ProductService();
  final CategoryData category;

  CategoryScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: <Widget>[
      CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: 55, bottom: 16),
            title: Text(
              category.desc,
              style: TextStyle(
                  color: Color.fromARGB(255, 252, 252, 252),
                  fontWeight: FontWeight.w500),
            ),
          ),
          centerTitle: false,
        ),
        FutureBuilder(
            future: productService.getProductList(category.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    color: Colors.white,
                  ),
                );
              } else {
                var items = snapshot.data["data"].length;
                return items > 0
                    ? Container(
                        child: CustomBestSeller(snapshot, ""),
                      )
                    : SliverToBoxAdapter(
                        child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Text(
                                "Page not found 404!",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, right: 50, left: 50),
                                child:
                                    Image.asset("images/johnTravolta404.gif"))
                          ],
                        ),
                      ));
              }
            }),
      ]),
    ]));
  }
}
