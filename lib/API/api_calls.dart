// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:telehealthcare/seach_in_forget_pass.dart';
import 'package:telehealthcare/user_data.dart';

class FirebaseAPI {
  String serachEmail;
  FirebaseAPI({Key? key, required this.serachEmail});
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getData() async {
    final docRef = _db.collection("users data").doc(serachEmail.toString());
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // MyAPI.postData();
        // WhatUser.gender = data['gender'];
        // WhatUser.email = data['email'];
        // WhatUser.username = data['username'];
        // WhatUser.confirmpassword = data['confirmpassword'];
        // WhatUser.dateofbirth = data['dateofbirth'];
        // WhatUser.phonenumber = data['phonenumber'];
        // WhatUser.cholestrollevel = data['cholestrollevel'];
        // WhatUser.bloodsugar = data['bloodsugar'];
        // WhatUser.bloodpressaure = data['bloodpressaure'];
        // print(WhatUser.gender);
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return null;
  }
}

class Api {
  Dio dio = Dio();

  Future<dynamic> predict(List data) async {
    final response = await dio.post(
        'https://senior-api-73pplnaibq-uc.a.run.app/predict/',
        data: {"data": data});

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Request failed with status: ${response.statusCode}.");
    }
  }
}

class GetReading {
  // String serachEmail;
  // GetReading({Key? key, required this.serachEmail});
  // final CollectionReference collectionReference = Firestore.instance.collection('your_collection_name');
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> getData() async {
    final DocumentSnapshot snapshot =
        await _db.collection("users data").doc(WhatUser.email).get();

    final List<dynamic> data = snapshot['Heart_Rate_Readings'];
    // final x = data as List<Map<String, dynamic>>;
    // print(x);
    return data.cast<Map<String, dynamic>>();
  }
}

class GetModelReading {
  // String serachEmail;
  // GetReading({Key? key, required this.serachEmail});
  // final CollectionReference collectionReference = Firestore.instance.collection('your_collection_name');
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<Map<String, dynamic>> getModelData() async {
    final DocumentSnapshot snapshot =
        await _db.collection("users data").doc(WhatUser.email).get();

    final data = snapshot['model_data'];
    // final x = data as List<Map<String, dynamic>>;
    // print(x);
    return data;
  }
}
// class MyAPI {
//   final dio = Dio();

//   static const baseUrl = "https://senior-api-73pplnaibq-uc.a.run.app/predict/";
//   final body = {
//     "data": [40, 0, 1, 140, 289, 0, 0, 172, 1, 0, 1]
//   };

//   Future<http.Response> postData(body) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       body: body,
//     );
//     print(response.body);
//     return response;
//   }
// }

// class dioApi {
//   final dio = Dio();
//   final body = { "data": [40, 0, 1, 140, 289, 0, 0, 172, 1, 0, 1]};
//   static const baseUrl = "https://senior-api-73pplnaibq-uc.a.run.app/predict/";

//   final responsew = await dio.post(baseUrl,data: body);

// }

