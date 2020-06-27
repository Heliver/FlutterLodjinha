import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lodjinha/widgets/custom_banner.dart';
import 'package:lodjinha/widgets/custom_best_seller.dart';
import 'package:lodjinha/widgets/custom_category.dart';
import 'package:lodjinha/services/product_service.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  var productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 55, bottom: 10),
              title: Row(
                children: <Widget>[
                  Image.asset("images/logo_navbar.png", height: 30),
                  SizedBox(width: 6.0),
                  const Text(
                    "a Lodjinha",
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 252, 252),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Pacifico"),
                  ),
                ],
              ),
              centerTitle: false,
            ),
          ),
          CustomBanner(120.0),
          CustomCategory(),
          SliverToBoxAdapter(
            child: Divider(thickness: 1),
          ),
          FutureBuilder(
              future: productService.getBestSeller(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 100.0,
                      alignment: Alignment.center,
                      child: Center(
                        child:
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                        ),
                      )
                    ),
                  );
                } else {
                  return CustomBestSeller(snapshot, "Mais Vendidos");
                }
              })
        ],
      )
    ]);
  }
}
