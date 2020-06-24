import 'package:flutter/material.dart';
import 'package:lodjinha/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController _pageController;

  CustomDrawer(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.all(0.0),
                decoration:
                    new BoxDecoration(color: Theme.of(context).primaryColor),
                child: Container(
                  child: Stack(children: <Widget>[
                    Image.asset("images/menu_pattern.png", fit: BoxFit.contain),
                    Positioned(
                      left: 16.0,
                      top: 30.0,
                      child: Stack(children: <Widget>[
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: new BoxDecoration(
                            color: Color.fromARGB(255, 241, 80, 37),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                                child: Image.asset("images/logo_menu.png")),
                          ),
                        ),
                      ]),
                    ),
                    Positioned(
                      bottom: 8.0,
                      right: 18.0,
                      child: Text(
                        "a Lodjinha",
                        style: TextStyle(
                            fontSize: 24.0,
                            fontFamily: "Pacifico",
                            letterSpacing: -0.5,
                            color: Colors.white),
                      ),
                    )
                  ]),
                ),
              ),
              DrawerTile("images/home_menu.png", "Home", _pageController, 0),
              DrawerTile("images/tag_menu.png", "Sobre o aplicativo",
                  _pageController, 1)
            ],
          )
        ],
      ),
    );
  }
}
