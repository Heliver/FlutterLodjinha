import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String _icon;
  final String _text;
  final PageController _pageController;
  final int _page;

  DrawerTile(this._icon, this._text, this._pageController, this._page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          _pageController.jumpToPage(_page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Image.asset(
                  _icon,
                  fit: BoxFit.cover,
                  height: 25.0,
                  width: 25.0,
                ),
              ),
              SizedBox(width: 18.0),
              Text(
                _text,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.5,
                    color: Color.fromARGB(255, 45, 49, 66)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
