import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lodjinha/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/splash.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: FadeAnimatedTextKit(
                  duration: Duration(milliseconds: 10000),
                  isRepeatingAnimation: true,
                  totalRepeatCount: 1,
                  text: ["MarketPlace B2W"],
                  alignment: AlignmentDirectional.centerStart,
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.courgette(
                    color: Color.fromARGB(255, 252, 252, 252),
                    fontSize: 40,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Vamos lá?",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  RaisedButton(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}