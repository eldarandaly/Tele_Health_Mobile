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

class MakeAAppoiment extends StatefulWidget {
  String getName = '';
  MakeAAppoiment({required this.getName});
  @override
  _MakeAAppoiment createState() => _MakeAAppoiment();
}

class _MakeAAppoiment extends State<MakeAAppoiment> {
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
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text("Tele Health",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
          backgroundColor: Colors.blue,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        drawer: CustomDrawer(),
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello                                                            ',
                    style: TextStyles.titleNormal,
                  ),
                  Text(
                    '${WhatUser.username}                                 ',
                    style: TextStyles.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(' what is your problem and pick a date',
                      style: TextStyles.titleMedium),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? "Enter a Problem" : null,
                          onChanged: (val) {
                            setState(() => name = val);
                          },
                          decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                fontFamily: "Muli",
                                fontSize: 19,
                              ),
                              icon: Icon(Icons.emergency_rounded),
                              labelText: 'Problem',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextField(
                          controller: dateInput,
                          decoration: const InputDecoration(
                              labelText: 'when Appoiment',
                              icon: Icon(Icons.date_range_outlined),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);
                              setState(() {
                                dateInput.text = formattedDate;
                                dateOfApp = formattedDate;
                              });
                            } else {}
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Saved"),
                              content: Text(
                                  'Your Appoiment is placed on $dateOfApp With doctor ${widget.getName.toString()} '),
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
                      }
                    },
                    child: Text("Make a Appoiment"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
