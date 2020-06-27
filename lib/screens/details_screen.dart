import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lodjinha/datas/product_data.dart';
import 'package:lodjinha/services/product_service.dart';
import 'package:lodjinha/widgets/custom_floating_buttom.dart';
import 'package:lodjinha/widgets/custom_html.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  final ProductService productService = ProductService();
  final ProductData product;
  String document;

  DetailsScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).primaryColor, //change your color here
                ),
              ),
              SliverToBoxAdapter(
                  child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 0.0),
                    height: 180,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      errorWidget: (context, url, error) => Image.asset(
                        "images/not_found.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      product.name,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Divider(thickness: 1),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 4.0, bottom: 0.0, left: 20),
                            child: Text(
                              "De: ${product.oldPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 170, 170, 170),
                                  decoration: TextDecoration.lineThrough),
                            ),
                          )),
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 0.0, right: 20),
                          child: Text(
                              "Por: ${product.newPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 241, 80, 37),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.8)),
                        ),
                      )
                    ],
                  ),
                  Divider(thickness: 1),
                  CustomHtml(product.desc),
                ],
              )),
            ]),
          ),
          CustomFloatingButtom(16.0, 16.0, "Produto reservado com sucesso",
              "Operação não realizada, tente mais tarde.", product.id),
        ],
      ),
    );
  }
}
