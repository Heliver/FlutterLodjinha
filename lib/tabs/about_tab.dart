import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(top: 50.0, bottom: 18.0),
          child: Center(
            child: Image.asset(
              "images/logo_sobre.png",
              fit: BoxFit.contain,
              height: 150.0,
              width: 150.0,
            ),
          )),
      Text(
        "a Lodjinha",
        style: TextStyle(
            color: Color.fromARGB(255, 74, 74, 74),
            fontFamily: "Pacifico",
            fontSize: 60.0,
            letterSpacing: -0.8),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child:Text(
                  "Hugo Ferreira",
                style: TextStyle(
                    color: Color.fromARGB(255, 45, 49, 66),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.3
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text("24 de Junho de 2020",
                style: TextStyle(
                    color: Color.fromARGB(255, 74, 74, 74),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.3
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
