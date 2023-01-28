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
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          height: screenHeight * 0.86,
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
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 50,
                                    child:
                                        Image.asset('assets/icons/logo.png'))),
                            const SizedBox(
                              height: 24,
                            ),
                            viewEmpData(snap, index, "Email", "email",
                                Icons.email_outlined),
                            const SizedBox(
                              height: 24,
                            ),
                            viewEmpData(snap, index, "username", "username",
                                Icons.alternate_email),
                            const SizedBox(
                              height: 24,
                            ),
                            viewEmpData(snap, index, "blood pressure",
                                "blood pressure", Icons.bloodtype),
                            const SizedBox(
                              height: 24,
                            ),
                            viewEmpData(snap, index, "cholesterol",
                                "cholesterol level", Icons.bloodtype),
                            const SizedBox(
                              height: 24,
                            ),
                            viewEmpData(
                                snap, index, "Gender", "gender", Icons.male),
                            const SizedBox(
                              height: 24,
                            ),
                            viewEmpData(snap, index, "Date of Brith",
                                "date of birth", Icons.date_range_outlined),
                            const SizedBox(
                              height: 24,
                            ),
                            viewEmpData(snap, index, "PhoneNumber",
                                "phonenumber", Icons.phone),
                            const SizedBox(
                              height: 24,
                            ),
                            viewEmpData(snap, index, "Gradine_Name",
                                "gradine_Name", Icons.shield),
                            const SizedBox(
                              height: 24,
                            ),
                            viewEmpData(snap, index, "Gradine Number",
                                "gradine_Number", Icons.phone),
                            const SizedBox(
                              height: 24,
                            ),
                            const Divider(
                              height: 3,
                              thickness: 5,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 24),
                            viewModelData(
                                snap, index, 'RestingBP', 'RestingBP'),
                            const SizedBox(height: 24),
                            viewModelData(
                                snap, index, 'ChestpainType', 'ChestpainType'),
                            const SizedBox(height: 24),
                            viewModelData(snap, index, 'ExerciseAngina',
                                'ExerciseAngina'),
                            const SizedBox(height: 24),
                            viewModelData(snap, index, 'MaxHR', 'MaxHR'),
                            const SizedBox(height: 24),
                            viewModelData(snap, index, 'Age', 'age'),
                            const SizedBox(height: 200),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
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
      int index, var title, String field, dynamic viewIcon) {
    var see = snap[index][field];
    if (see == 'M' || see == 'm' || see == '1') {
      see = 'Male';
    } else if (see == 'f' || see == 'F' || see == '0') {
      see = 'Female';
    }
    // print(snap[index]['model_data']['RestingBP']);
    return TextFormField(
      // enabled: false,
      decoration: InputDecoration(
        icon: Icon(viewIcon),
        hintStyle: const TextStyle(
          color: Colors.blue,
          fontFamily: "Muli",
          fontSize: 20,
        ),

        labelStyle: const TextStyle(
          color: Colors.black,
          fontFamily: "Muli",
          fontSize: 19,
        ),
        labelText: title,
        enabled: false,
        hintText: see,
        // disabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        // ),

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

TextFormField viewModelData(List<QueryDocumentSnapshot<Object?>> snap,
    int index, var title, dynamic field) {
  return TextFormField(
    // enabled: false,
    decoration: InputDecoration(
      hintStyle: const TextStyle(
        color: Colors.blue,
        fontFamily: "Muli",
        fontSize: 20,
      ),

      labelStyle: const TextStyle(
        color: Colors.black,
        fontFamily: "Muli",
        fontSize: 19,
      ),
      labelText: title,
      enabled: false,
      hintText: snap[index]['model_data'][field].toString(),
      // disabledBorder: const OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(20)),
      // ),

      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}
