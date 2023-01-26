import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:telehealthcare/drawer/custom_drawer.dart';
import 'package:telehealthcare/heart_readings/heart_chart.dart';
// import 'package:telehealthcare/API/screen.dart';
// import 'package:telehealthcare/sign_up_transition.dart';
// import 'package:telehealthcare/size_config.dart';
import 'package:telehealthcare/user_data.dart';

class PatientsDataForDoctor extends StatelessWidget {
  // final String thisEmail;
  // ProfilePageClass({Key? key, required this.thisEmail});
  @override
  Widget build(BuildContext context) {
    // FirebaseAPI d = FirebaseAPI(serachEmail: thisEmail);
    // d.getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      drawer: CustomDrawer(),
      body: Body(),
    );
  }
}

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
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      if (snap[index]['isADoctor'] == false) {
                        final List<dynamic> chart_data =
                            snap[index]['Heart_Rate_Readings'];
                        chart_data.cast<Map<String, dynamic>>();
                        return SingleChildScrollView(
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
                              viewEmpData(snap, index, "Username", "username",
                                  Icons.alternate_email),
                              const SizedBox(
                                height: 24,
                              ),
                              viewEmpData(snap, index, "PhoneNumber",
                                  "phonenumber", Icons.phone),
                              const SizedBox(
                                height: 24,
                              ),
                              SizedBox(
                                height: 500,
                                width: 500,
                                child: AllHeartRateLineChart(
                                  personEmail: snap[index]['email'].toString(),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              const Divider(
                                height: 3,
                                thickness: 5,
                                color: Colors.blue,
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        );
                      } else {
                        return Text('');
                      }
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
        //   borderRadius: BorderRadius.all(Radius.circular(20)),
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
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),

      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}
