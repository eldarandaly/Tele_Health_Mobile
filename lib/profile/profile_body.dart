import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:telehealthcare/API/screen.dart';
// import 'package:telehealthcare/sign_up_transition.dart';
// import 'package:telehealthcare/size_config.dart';
import 'package:telehealthcare/user_data.dart';

class Body extends StatelessWidget {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(2),
        child: Container(
          width: 600,
          height: 500,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users data")
                  .where('email', isEqualTo: (WhatUser.email))
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          // Column(
                          //   children: [
                          //     SizedBox(
                          //       height: 11,
                          //       width: 11,
                          //       child: Stack(
                          //         fit: StackFit.expand,
                          //         clipBehavior: Clip.none,
                          //       ),
                          //     )
                          //   ],
                          // ),
                          SizedBox(
                            width: 333,
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage('assets/icons/logo.png'),
                                    )),
                                const SizedBox(
                                  height: 24,
                                ),
                                viewEmpData(snap, index, "Email", "email"),
                                const SizedBox(
                                  height: 24,
                                ),
                                viewEmpData(snap, index, "blood pressure",
                                    "blood pressure"),
                                const SizedBox(
                                  height: 24,
                                ),
                                viewEmpData(snap, index, "cholesterol",
                                    "cholesterol level"),
                                const SizedBox(
                                  height: 24,
                                ),
                                viewEmpData(snap, index, "gender", "gender"),
                                const SizedBox(
                                  height: 24,
                                ),
                                viewEmpData(snap, index, "Date of Brith",
                                    "date of birth"),
                                const SizedBox(
                                  height: 24,
                                ),
                                viewEmpData(
                                    snap, index, "username", "username"),
                                const SizedBox(
                                  height: 24,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              }),
        ),
      ),
    );
  }

  // TextFormField viewEmpID() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: "ID",
  //       labelStyle: TextStyle(
  //           fontFamily: "Muli", fontSize: 600 / 24, color: Colors.blue),
  //       hintText: WhatUser.id,
  //       hintStyle: TextStyle(
  //           fontFamily: "Muli", fontSize: 600 / 25, color: Colors.black),
  //       enabled: false,

  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //     ),
  //   );
  // }

  TextFormField viewEmpData(List<QueryDocumentSnapshot<Object?>> snap,
      int index, var title, String field) {
    return TextFormField(
      // enabled: false,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.blue,
          fontFamily: "Muli",
          fontSize: 20,
        ),

        labelStyle: TextStyle(
          color: Colors.black,
          fontFamily: "Muli",
          fontSize: 19,
        ),
        labelText: title,
        enabled: false,
        hintText: snap[index][field],
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
