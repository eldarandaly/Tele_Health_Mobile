import 'package:flutter/material.dart';
import 'package:telehealthcare/seach_in_forget_pass.dart';
import 'package:telehealthcare/signin.dart';
import 'main.dart';

class forgetpass extends StatelessWidget {
  const forgetpass({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TeleHealthCare",
              style: TextStyle(
                  color: Colors.lightBlue, fontWeight: FontWeight.w800)),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
        ),
        body: ListView(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: []),
          Container(height: 10),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Find your account",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
                Container(height: 25),
                Text(
                  " Enter Email or mobile number",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Container(height: 15),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                Container(height: 15),
              ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 15),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const search()));
                  },
                  child: Text(
                    "search",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(250.0),
                      backgroundColor: Colors.blueAccent)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signin()));
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(250.0),
                      backgroundColor: Colors.grey)),
              Container(height: 20),
            ],
          )
        ]));
  }
}
