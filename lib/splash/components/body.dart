// ignore_for_file: library_private_types_in_public_api

import 'constants.dart';
import 'package:telehealthcare/sign_in/signin.dart';
import 'package:telehealthcare/size_config.dart';
import 'package:flutter/material.dart';

// This is the best practice
import '../components/splash_content.dart';
// import '../../../components/default_button.dart';
import 'default_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List splashTitle = [
    {
      "boldTitle": "AAST Tele Health Care",
    },
    {
      "boldTitle": "Heart Rate Reading",
    },
    {
      "boldTitle": "Heart Disease Prediction",
    },
    {
      "boldTitle": "How to Place Device",
    },
  ];
  List splashData = [
    {
      "text": "Welcome To Tele Health Care",
      "image": "assets/icons/logo.png",
    },
    {
      "text": "this app will Heart Rate Reading",
      "image": "assets/images/juicy-heart-with-cardiogram.png",
    },
    {
      "text": "Heart Disease Prediction Using AI",
      "image": "assets/images/heart.png",
    },
    {
      "text": "Follow This Steps",
      "image": "assets/images/ECG-placement.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(children: <Widget>[
          Expanded(
            flex: 2,
            child: PageView.builder(
              onPageChanged: ((value) {
                setState(() {
                  currentPage = value;
                });
              }),
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                headtitle: splashTitle[index]["boldTitle"],
                image: splashData[index]["image"],
                text: splashData[index]["text"],
              ),
            ),
          ),
          Container(
            height: 80,
            child: Column(
              children: <Widget>[
                // const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                // const Spacer(flex: 1),
                SizedBox(
                  height: 10,
                ),
                showButton(currentPage),
                Spacer(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }

  Widget showButton(index) {
    if (index == 3) {
      return Container(
        height: 50,
        width: 300,
        child: DefaultButton(
          text: "Lets go",
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const signin()));
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
