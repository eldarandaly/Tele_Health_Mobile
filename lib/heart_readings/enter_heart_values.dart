import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:telehealthcare/API/api_calls.dart';
import 'package:telehealthcare/check_herat/chechk_heart_screen.dart';
import 'package:telehealthcare/sign_up_transition.dart';
import 'package:telehealthcare/size_config.dart';
import 'package:telehealthcare/user_data.dart';
import 'package:telehealthcare/profile/profile_body.dart';
import 'dart:convert';

class HeartReadingPage extends StatefulWidget {
  @override
  _HeartReadingPageState createState() => _HeartReadingPageState();
}

class _HeartReadingPageState extends State<HeartReadingPage> {
  final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }

  List<int> _heartReadings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Heart Readings'),
      // ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _heartReadings.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.favorite,
                      size: 50,
                      color: Colors.red,
                    ),
                    title: Text('Reading ${index + 1}'),
                    subtitle: Text(_heartReadings[index].toString() + ' BPM'),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: fieldText,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter heart reading',
              ),
              onSubmitted: (value) {
                setState(() {
                  _heartReadings.add(int.parse(value));
                  clearText();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
