import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telehealthcare/sign_up_2.dart';
import 'package:telehealthcare/signin.dart';
import 'register.dart';
import 'database.dart';
import 'authentication.dart';
import 'user_data.dart';

class signup2 extends StatefulWidget {
  MyUser savedUser;
  signup2({key, required this.savedUser}) : super(key: key);
  @override
  State<signup2> createState() => _signup2State();
}

class _signup2State extends State<signup2> {
  final _formkey = GlobalKey<FormState>();
  String cholestrollevel = "";
  String bloodsugar = "";
  String bloodpressaure = "";
  String email = "";
  String username = "";
  String password = "";
  String confirmpassword = "";
  String dateofbirth = "";
  String gender = "";
  String error = "";
  String phonenumber = "";
  final AuthService _auth = new AuthService();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TeleHealthCare",
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
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(200.0),
                      backgroundColor: Colors.white,
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(200.0),
                        backgroundColor: Colors.blueAccent))
              ]),
          Container(height: 50),
          Form(
              key: _formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            Container(height: 15),
                            // Text(
                            //   "  Cholestrol level",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (val) => val!.isEmpty
                                  ? "Please fill this textbox"
                                  : null,
                              onChanged: (val) {
                                setState(() => cholestrollevel = val);
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Cholestrol level',
                                  icon: Icon(Icons.oil_barrel),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                            ),
                            Container(height: 15),
                            // const Text(
                            //   "  Blood sugar",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (val) => val!.isEmpty
                                  ? "Please fill this textbox"
                                  : null,
                              onChanged: (val) {
                                setState(() => bloodsugar = val);
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Blood sugar',
                                  icon: Icon(Icons.bloodtype_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                            ),
                            Container(height: 15),
                            // const Text(
                            //   "  Blood pressaure",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (val) => val!.isEmpty
                                  ? "Please fill this textbox"
                                  : null,
                              onChanged: (val) {
                                setState(() => bloodpressaure = val);
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Blood pressaure',
                                  icon: Icon(Icons.thumbs_up_down_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 25),
              ElevatedButton(
                  onPressed: () async {
                    dynamic result =
                        await _auth.signupwithemailandpassword(email, password);
                    await DatabaseService(uid: widget.savedUser.email)
                        .updateUserData(
                            widget.savedUser.email,
                            widget.savedUser.username,
                            widget.savedUser.password,
                            widget.savedUser.confirmpassword,
                            widget.savedUser.phonenumber,
                            widget.savedUser.gender,
                            widget.savedUser.dateofbirth,
                            cholestrollevel,
                            bloodpressaure,
                            bloodsugar);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signin()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(250.0),
                      backgroundColor: Colors.blueAccent),
                  child: const Text("Save",
                      style: TextStyle(color: Colors.white))),
              Container(height: 20),
            ],
          )
        ]));
  }
}
