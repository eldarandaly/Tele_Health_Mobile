import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telehealthcare/database.dart';
import 'package:telehealthcare/sign_up_2.dart';
import 'package:telehealthcare/signin.dart';
import 'authentication.dart';
import 'user_data.dart';
import 'package:intl/intl.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();

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

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("TeleHealthCare",
        //       style: TextStyle(
        //           color: Colors.lightBlue, fontWeight: FontWeight.w800)),
        //   backgroundColor: Colors.grey[900],
        //   centerTitle: true,
        // ),
        body: ListView(children: [
      // Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => const signin())); // transition
      //           },
      //           child: const Text(
      //             "Sign in",
      //             style: TextStyle(color: Colors.blueAccent),
      //           ),
      //           style: ElevatedButton.styleFrom(
      //             fixedSize: const Size.fromWidth(200.0),
      //             backgroundColor: Colors.white,
      //           )),
      //       ElevatedButton(
      //           onPressed: () {},
      //           child: const Text(
      //             "Sign up",
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           style: ElevatedButton.styleFrom(
      //               fixedSize: const Size.fromWidth(200.0),
      //               backgroundColor: Colors.blueAccent))
      //     ]),
      Container(height: 20, color: Colors.white),
      Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.blue[300],
                ),
                child: const Center(
                  child: Text(
                    'Create your New account at \n          Tele Health Care',
                    style: TextStyle(
                      fontFamily: "Muli",
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      Container(
        color: Colors.white,
        child: Form(
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
                          Container(height: 20),
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
                                    labelStyle: TextStyle(
                                      fontFamily: "Muli",
                                      fontSize: 19,
                                    ),
                                    icon: Icon(Icons.email),
                                    labelText: ' Email',
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    )),
                              ),
                            ),
                          ),
                          Container(height: 20),
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
                          Container(height: 20),
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
                          Container(height: 20),
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
                          Container(height: 20),
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
                          Container(height: 20),
                          TextField(
                            controller: dateInput,
                            decoration: const InputDecoration(
                                labelText: 'Date of birth',
                                icon: Icon(Icons.date_range_outlined),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(1990),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));
                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  dateInput.text = formattedDate;
                                  dateofbirth = formattedDate;
                                });
                              } else {}
                            },
                          ),
                          // TextFormField(
                          //   keyboardType: TextInputType.datetime,
                          //   validator: (val) => val!.isEmpty
                          //       ? "please fill the date of birth"
                          //       : null,
                          //   onChanged: (val) {
                          //     setState(() => dateofbirth = val);
                          //   },
                          //   decoration: const InputDecoration(
                          //       labelText: 'Date of birth',
                          //       icon: Icon(Icons.date_range_outlined),
                          //       border: OutlineInputBorder(
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(10)),
                          //       )),
                          // ),
                          Container(height: 20),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Pick a Gender',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600]),
                                ),
                                Container(
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(color: Colors.grey),
                                  //     borderRadius: BorderRadius.all(
                                  //         Radius.circular(10))),
                                  child: GenderPickerWithImage(
                                    showOtherGender: false,
                                    verticalAlignedText: false,
                                    selectedGender: null,
                                    selectedGenderTextStyle: const TextStyle(
                                        color: Color(0xFF8b32a8),
                                        fontWeight: FontWeight.bold),
                                    unSelectedGenderTextStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                    onChanged: (Gender? genderAvatar) {
                                      gender = genderAvatar.toString();
                                      if (gender == 'Gender.Male') {
                                        gender = 'Male';
                                      } else {
                                        gender = 'Female';
                                      }

                                      print(gender);
                                    },
                                    equallyAligned: false,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    isCircular: true,
                                    // default : true,
                                    opacityOfGradient: 0.4,
                                    padding: const EdgeInsets.all(3),
                                    size: 100, //default : 40
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // TextFormField(
                          //   validator: (val) =>
                          //       val!.isEmpty ? "please fill the Gender" : null,
                          //   onChanged: (val) {
                          //     setState(() => gender = val);
                          //   },
                          //   decoration: const InputDecoration(
                          //       labelText: 'Gender',
                          //       icon: Icon(Icons.male),

                          //       // prefixIcon: Icon(Icons.male),
                          //       border: OutlineInputBorder(
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(10)),
                          //       )),
                          // ),
                          Container(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(height: 20),
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
                ])),
      )
    ]));
  }
}
