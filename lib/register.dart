import 'package:flutter/material.dart';
import 'package:telehealthcare/database.dart';
import 'package:telehealthcare/sign_up_2.dart';
import 'package:telehealthcare/signin.dart';
import 'authentication.dart';
import 'user_data.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String username = "";
  String password = "";
  String confirmpassword = "";
  String dateofbirth = "";
  String gender = "";
  String error = "";
  String phonenumber = "";
  String cholestrollevel = "";
  String bloodsugar = "";
  String bloodpressaure = "";

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
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            // const Text(
                            //   "  Email",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            Center(
                              child: SizedBox(
                                width: 300,
                                child: TextFormField(
                                  validator: (val) =>
                                      val!.isEmpty ? "Enter an email" : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.email),
                                      labelText: ' Email',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      )),
                                ),
                              ),
                            ),
                            Container(height: 15),
                            // const Text(
                            //   "  Username",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            TextFormField(
                              validator: (val) => val!.isEmpty
                                  ? "this username is already taken"
                                  : null,
                              onChanged: (val) {
                                setState(() => username = val);
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Username',
                                  icon: Icon(Icons.alternate_email),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                            ),
                            Container(height: 15),
                            // const Text(
                            //   "  Password",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            TextFormField(
                              validator: (val) => val!.length < 8
                                  ? "Password must be 8 charchter"
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                icon: Icon(Icons.password),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            Container(height: 15),
                            // const Text(
                            //   "  Confirm password",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            TextFormField(
                              validator: (val) => val!.compareTo(password) == 1
                                  ? "confirm password"
                                  : null,
                              onChanged: (val) {
                                setState(() => confirmpassword = val);
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                  labelText: 'Confirm Password',
                                  icon: Icon(Icons.password),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                            ),
                            Container(height: 15),
                            // const Text(
                            //   "  Phone number",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (val) => val!.isEmpty
                                  ? "please insert a phone number"
                                  : null,
                              onChanged: (val) {
                                setState(() => phonenumber = val);
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Phone Number',
                                  icon: Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                            ),
                            Container(height: 15),
                            // const Text(
                            //   "  Date of birth",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            TextFormField(
                              keyboardType: TextInputType.datetime,
                              validator: (val) => val!.isEmpty
                                  ? "please fill the date of birth"
                                  : null,
                              onChanged: (val) {
                                setState(() => dateofbirth = val);
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Date of birth',
                                  icon: Icon(Icons.date_range_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                            ),
                            Container(height: 15),
                            // const Text(
                            //   "  Gender",
                            //   style: TextStyle(
                            //       color: Colors.blueAccent,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 20),
                            // ),
                            Container(height: 15),
                            TextFormField(
                              validator: (val) => val!.isEmpty
                                  ? "please fill the Gender"
                                  : null,
                              onChanged: (val) {
                                setState(() => gender = val);
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Gender',
                                  icon: Icon(Icons.male),

                                  // prefixIcon: Icon(Icons.male),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                            ),
                            Container(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(height: 15),
                                ElevatedButton(
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        dynamic result = await _auth
                                            .signupwithemailandpassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                "please enter valid information";
                                          });
                                        } else {
                                          final saveUser = MyUser(
                                              email: email,
                                              username: username,
                                              password: password,
                                              dateofbirth: dateofbirth,
                                              bloodpressaure: bloodpressaure,
                                              bloodsugar: bloodsugar,
                                              cholestrollevel: cholestrollevel,
                                              confirmpassword: confirmpassword,
                                              phonenumber: phonenumber,
                                              error: error,
                                              gender: gender);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => signup2(
                                                      savedUser: saveUser)));
                                        }
                                      }
                                    },
                                    child: const Text("Next",
                                        style: TextStyle(color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size.fromWidth(250.0),
                                        backgroundColor: Colors.blueAccent)),
                                Container(height: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ]))
        ]));
  }
}
