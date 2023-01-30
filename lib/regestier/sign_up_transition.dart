import 'package:flutter/material.dart';

import 'package:telehealthcare/regestier/sign_up_2.dart';
import 'package:telehealthcare/sign_in/signin.dart';
import '../main.dart';
import '../data_base/authentication.dart';
import 'package:telehealthcare/main.dart';

final email = TextEditingController();
final username = TextEditingController();
final password = TextEditingController();
final confirmpassword = TextEditingController();
final dateofbirth = TextEditingController();
final Gender = TextEditingController();
final cholestrollevel = TextEditingController();
final bloodsugar = TextEditingController();
final bloodpressaure = TextEditingController();
// final AuthService _auth = new AuthService();

bool validate = false;

class signuptrans extends StatelessWidget {
  const signuptrans({super.key});
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
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const signin())); // transition
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(200.0),
                      backgroundColor: Colors.white,
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(200.0),
                        backgroundColor: Colors.blueAccent))
              ]),
          Container(height: 50),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  Email",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Container(height: 15),
                TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: email),
                Container(height: 15),
                Text(
                  "  Username",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Container(height: 15),
                TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: username),
                Container(height: 15),
                Text(
                  "  Password",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Container(height: 15),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: password,
                ),
                Container(height: 15),
                Text(
                  "  Confirm password",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Container(height: 15),
                TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: confirmpassword),
                Container(height: 15),
                Text(
                  "  Date of birth",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Container(height: 15),
                TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: dateofbirth),
                Container(height: 15),
                Text(
                  "  Gender",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Container(height: 15),
                TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    controller: Gender),
              ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 15),
              ElevatedButton(
                  onPressed: () async {
                    //  amountController1.value = amountController.value ;  // copy content
                    // dynamic result = await _auth.signupwithemailandpassword(email, password)
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signuptrans()));
                  },
                  child: Text("Next", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(250.0),
                      backgroundColor: Colors.blueAccent)),
              Container(height: 20),
            ],
          )
        ]));
  }
}
