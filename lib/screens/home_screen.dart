import 'package:flutter/material.dart';
import 'package:lodjinha/tabs/about_tab.dart';
import 'package:lodjinha/tabs/home_tab.dart';
import 'package:lodjinha/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: false,
            title: Text(
              "sobre",
              style: TextStyle(color: Colors.white),
            ),
          ),
          drawer: CustomDrawer(_pageController),
          body: AboutTab(),
        ),
      ],
    );
  }
}
