import 'package:flutter/material.dart';
import 'new_home_page.dart';
import '../theme/light_color.dart';
import '../theme/text_styles.dart';
import '../theme/extention.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => CoolHomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.jpg"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: .6,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 235, 171, 171),
                        Color.fromARGB(255, 119, 74, 74)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                      stops: [.5, 6]),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Image.asset(
                "assets/icons/icons8-heart-disease-64.png",
                color: Colors.white,
                height: 100,
              ),
              Text(
                "Tele Health Care",
                style: TextStyles.h1Style.white,
              ),
              Text(
                "Senior Grad Project",
                style: TextStyles.bodySm.white.bold,
              ),
              Expanded(
                flex: 7,
                child: SizedBox(),
              ),
            ],
          ).alignTopCenter,
        ],
      ),
    );
  }
}
