import 'package:flutter/material.dart';
import 'package:telehealthcare/database.dart';
import 'package:telehealthcare/seach_in_forget_pass.dart';
import 'package:telehealthcare/sign_up_2.dart';
import 'package:telehealthcare/sign_up_transition.dart';
import 'package:telehealthcare/user_data.dart';
import 'authentication.dart';
import 'register.dart';
import 'forget pass.dart';
import 'sign_up_2.dart';
import 'package:telehealthcare/home_page.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final _formkey = GlobalKey<FormState>();
  final DatabaseService _mod = new DatabaseService();
  String email = "";
  String password = "";
  String error = "";
  final AuthService _auth = new AuthService();

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("TeleHealthCare",
      //       style: TextStyle(
      //           color: Colors.blueAccent, fontWeight: FontWeight.w800)),
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      // ),
      body: ListView(children: [
        SizedBox(
          height: 30,
        ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       ElevatedButton(
        //           onPressed: () async {
        //             //  dynamic result = await _auth.signinwithemailandpassword(email, password);
        //           },
        //           style: ElevatedButton.styleFrom(
        //             fixedSize: const Size.fromWidth(200.0),
        //             backgroundColor: Colors.blueAccent,
        //           ),
        //           child: const Text(
        //             "Sign in",
        //             style: TextStyle(color: Colors.white),
        //           )),
        //       ElevatedButton(
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) =>
        //                         const register())); // transition
        //           },
        //           style: ElevatedButton.styleFrom(
        //               fixedSize: const Size.fromWidth(200.0),
        //               backgroundColor: Colors.white),
        //           child: const Text(
        //             "Sign up",
        //             style: TextStyle(color: Colors.blueAccent),
        //           ))
        //     ]),
        Center(
          child: Image.asset(
            'assets/images/aast.png',
            width: 285.9,
            height: 150,
            fit: BoxFit.contain,
          ),
        ),

        Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("About"),
                        content: const Text(
                            "This application is Made By : ElDarandaly"),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.info_outline))),
        // Container(height: 20),
        Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 15),
              Center(
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    validator: (val) => val!.isEmpty ? "Enter an email" : null,
                    onChanged: (val) {
                      setState(() => email = (val));
                      WhatUser.email = val;
                      MyUser(
                          email: email,
                          username: "username",
                          password: password,
                          dateofbirth: 'dateofbirth',
                          bloodpressaure: 'bloodpressaure',
                          bloodsugar: 'bloodsugar',
                          cholestrollevel: 'cholestrollevel',
                          confirmpassword: 'confirmpassword',
                          phonenumber: 'phonenumber',
                          error: error,
                          gender: 'gender');
                    },
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),
              ),
              Container(height: 30),
              Center(
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? "Enter an password" : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),
              ),
              Container(height: 50),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        // _mod.addUserModelData();
                        // // _mod.addUserHRlData();
                        if (_formkey.currentState!.validate()) {
                          dynamic result = await _auth
                              .signinwithemailandpassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = "please enter valid information";
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content:
                                        Text('Check Your Email or Password'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Pop UP"),
                                  content: Text('Welecome ${WhatUser.email}'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  u: MyUser(
                                      email: email,
                                      username: 'username',
                                      password: password,
                                      dateofbirth: 'dateofbirth',
                                      bloodpressaure: 'bloodpressaure',
                                      bloodsugar: 'bloodsugar',
                                      cholestrollevel: 'cholestrollevel',
                                      confirmpassword: 'confirmpassword',
                                      phonenumber: 'phonenumber',
                                      error: error,
                                      gender: 'gender'),
                                ),
                              ),
                            ); // new page of sign in
                          }
                        }
                      },
                      icon: Icon(Icons.login),
                      label: Text('Signin'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fixedSize: const Size.fromWidth(200.0),
                          maximumSize: const Size.fromHeight(50.0),
                          backgroundColor: Colors.blue),
                    ),
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     if (_formkey.currentState!.validate()) {
                    //       dynamic result = await _auth
                    //           .signinwithemailandpassword(email, password);
                    //       if (result == null) {
                    //         setState(() {
                    //           error = "please enter valid information";
                    //         });
                    //       } else {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => HomePage(
                    //               u: MyUser(
                    //                   email: email,
                    //                   username: 'username',
                    //                   password: password,
                    //                   dateofbirth: 'dateofbirth',
                    //                   bloodpressaure: 'bloodpressaure',
                    //                   bloodsugar: 'bloodsugar',
                    //                   cholestrollevel: 'cholestrollevel',
                    //                   confirmpassword: 'confirmpassword',
                    //                   phonenumber: 'phonenumber',
                    //                   error: error,
                    //                   gender: 'gender'),
                    //             ),
                    //           ),
                    //         ); // new page of sign in
                    //       }
                    //     }
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(50)),
                    //       fixedSize: const Size.fromWidth(200.0),
                    //       maximumSize: const Size.fromHeight(50.0),
                    //       backgroundColor: Colors.blue),
                    //   child: const Text(
                    //     "Sign in",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const forgetpass()));
                        },
                        child: const Text("Forget your password?",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 15))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const register())); // transition
                        },
                        child: const Text("Create an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 15))),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  String newMethod(String val) => val;
}

class WhitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
