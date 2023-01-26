import 'package:telehealthcare/drawer/custom_drawer.dart';
import 'package:telehealthcare/heart_readings/heart_chart.dart';
import 'package:telehealthcare/home_page.dart';
import 'package:telehealthcare/new_home/home_main.dart';
import 'package:telehealthcare/signin.dart';
import 'package:telehealthcare/user_data.dart';
import 'package:intl/intl.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:flutter/material.dart';

class GradPage extends StatefulWidget {
  @override
  _GradPage createState() => _GradPage();
}

class _GradPage extends State<GradPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();
  late String _text;
  String name = '';
  String dateofbirth = '';
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text("Tele Health",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: Center(
          child: Container(
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    enabled: false,
                    validator: (val) => val!.isEmpty ? "Enter a Problem" : null,
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                    decoration: InputDecoration(
                        iconColor: Colors.black,
                        hintStyle: TextStyle(
                            fontFamily: "Muli",
                            fontSize: 22,
                            color: Colors.black),
                        icon: Icon(
                          Icons.shield,
                          color: Colors.black,
                        ),
                        hintText: (WhatUser.gradine_name),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    enabled: false,
                    validator: (val) => val!.isEmpty ? "Enter a Problem" : null,
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontFamily: "Muli",
                            fontSize: 22,
                            color: Colors.black),
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        hintText: (WhatUser.gradine_num),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Do something with the entered text
                        }
                      },
                      child: Text("Need Help !"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
