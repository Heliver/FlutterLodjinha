import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lodjinha/datas/product_best_seller_data.dart';

class CategoryTile extends StatelessWidget {
  final ProductBestSellerData bestSeller;

  CategoryTile(this.bestSeller);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, right: 4.0, bottom: 8.0, left: 4.0),
              child: Image.network(bestSeller.image, width: 50)),
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
                    bestSeller.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Text(bestSeller.desc,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 12.0)),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Text(
                          "De ${bestSeller.oldPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 170, 170, 170),
                              decoration: TextDecoration.lineThrough),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Por ${bestSeller.newPrice.toStringAsFixed(2)}",
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
    );
  }
}
