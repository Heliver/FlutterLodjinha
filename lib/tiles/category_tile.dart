import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lodjinha/datas/product_data.dart';
import 'package:lodjinha/screens/details_screen.dart';

class CategoryTile extends StatelessWidget {
  final ProductData product;

  CategoryTile(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsScreen(product)),
          );
        },
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 4.0, bottom: 8.0, left: 4.0),
                child: CachedNetworkImage(
                  width: 50.0,
                  imageUrl: product.image,
                  errorWidget: (context, url, error) =>
                      Image.asset("images/not_found.png", width: 50.0),
                ),
              ),
            ),
            Container(
                child: Expanded(
              flex: 5,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Text(product.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 12.0)),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 4.0),
                            child: Text(
                              "De ${product.oldPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 170, 170, 170),
                                  decoration: TextDecoration.lineThrough),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 4.0),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Por ${product.newPrice.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 241, 80, 37),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.8),
                                )),
                          ))
                    ],
                  )
                ],
              ),
            )),
            Expanded(
              flex: 1,
              child: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).primaryColor),
            ),
            Divider()
          ],
        ));
  }
}
