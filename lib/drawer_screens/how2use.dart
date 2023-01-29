import 'package:telehealthcare/drawer/custom_drawer.dart';
import 'package:telehealthcare/heart_readings/heart_chart.dart';
import 'package:telehealthcare/home_page.dart';
import 'package:telehealthcare/new_home/home_main.dart';
import 'package:telehealthcare/new_home/src/theme/text_styles.dart';
import 'package:telehealthcare/signin.dart';
import 'package:telehealthcare/user_data.dart';
import 'package:intl/intl.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:flutter/material.dart';

class How2use extends StatefulWidget {
  // String getName = '';
  // How2use({required this.getName});
  @override
  _How2use createState() => _How2use();
}

class _How2use extends State<How2use> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();
  late String _text;
  String name = '';
  String dateOfApp = '';

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 75,
          title: const Text("Tele Health",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
          backgroundColor: Colors.blue,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        drawer: CustomDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hello                                                            ',
                    style: TextStyles.titleNormal,
                  ),
                ),
                Text(
                  '${WhatUser.username}                                 ',
                  style: TextStyles.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'using this figure will help you place the Sensors on your Body',
                      style: TextStyles.titleNormal,
                    ),
                  ),
                ),
                Container(
                  child: Image.asset('assets/images/ECG-placement.jpg'),
                )
              ],
            ),
          ),
        ));
  }
}
