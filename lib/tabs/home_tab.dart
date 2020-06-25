import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lodjinha/widgets/custom_banner.dart';
import 'package:lodjinha/widgets/custom_best_seller.dart';
import 'package:lodjinha/widgets/custom_category.dart';

class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
            CustomBestSeller(),
          ],
        )
      ],
    );
  }
}
