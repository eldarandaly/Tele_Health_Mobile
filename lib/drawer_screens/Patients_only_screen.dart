import 'package:telehealthcare/drawer/custom_drawer.dart';
import 'package:telehealthcare/drawer_screens/make_appoiment.dart';
import 'package:telehealthcare/heart_readings/heart_chart.dart';
import 'package:telehealthcare/home/home_page.dart';
import 'package:telehealthcare/bottom_bar_nav/home_main.dart';
import 'package:telehealthcare/sign_in/signin.dart';
import 'package:telehealthcare/user_data.dart';
import 'dart:math';
import 'package:telehealthcare/drawer/custom_drawer.dart';

import 'package:flutter/material.dart';
import 'package:telehealthcare/API/api_calls.dart';
import 'package:telehealthcare/bottom_bar_nav/src/model/patient%20_model.dart';
import 'package:telehealthcare/user_data.dart';
import 'package:telehealthcare/bottom_bar_nav/src/model/dactor_model.dart';

import 'package:telehealthcare/bottom_bar_nav/src/model/data.dart';
import 'package:telehealthcare/bottom_bar_nav/src/theme/extention.dart';
import 'package:telehealthcare/bottom_bar_nav/src/theme/light_color.dart';
import 'package:telehealthcare/bottom_bar_nav/src/theme/text_styles.dart';
import 'package:telehealthcare/bottom_bar_nav/src/theme/theme.dart';
import 'package:flutter/material.dart';

class PatientsPageDraw extends StatefulWidget {
  @override
  _PatientsPageDraw createState() => _PatientsPageDraw();
}

class _PatientsPageDraw extends State<PatientsPageDraw> {
  final _formKey = GlobalKey<FormState>();
  late String _text;
  // late List<DoctorModel> doctorDataList;
  late List<PatientModel> patientDataList;
  @override
  void initState() {
    // doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    patientDataList =
        patientMapList.map((x) => PatientModel.fromJson(x)).toList();
    super.initState();
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  Widget _patientList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("patient", style: TextStyles.title.bold),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       title: const Text("Coming Soon"),
                    //       content: Text(''),
                    //       actions: <Widget>[
                    //         ElevatedButton(
                    //           child: const Text("OK"),
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
                  })
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          getPatientList()
        ],
      ),
    );
  }

  Widget getPatientList() {
    return Column(
        children: patientDataList.map((x) {
      return _patientTile(x);
    }).toList());
  }

  Widget _patientTile(PatientModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              // height: 55,
              // width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.asset(
                model.image,
                // height: 50,
                // width: 50,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          title: Text(model.name, style: TextStyles.title.bold),
          subtitle: Text(
            model.type,
            style: TextStyles.bodySm.subTitleColor.bold,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ).ripple(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MakeAAppoiment(getName: model.name)),
        );
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: CustomDrawer()
      //   leading: IconButton(
      //     icon: Icon(Icons.short_text),
      //     iconSize: 30,
      //     color: Colors.black,
      //     onPressed: () {
      //       // showDialog(
      //       //   context: context,
      //       //   builder: (BuildContext context) {
      //       //     return AlertDialog(
      //       //       title: const Text("Coming Soon"),
      //       //       content: Text(''),
      //       //       actions: <Widget>[
      //       //         ElevatedButton(
      //       //           child: const Text("OK"),
      //       //           onPressed: () {
      //       //             Navigator.of(context).pop();
      //       //           },
      //       //         ),
      //       //       ],
      //       //     );
      //       //   },
      //       // );
      //     },
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       iconSize: 30,
      //       color: LightColor.grey,
      //       onPressed: () {
      //         showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return AlertDialog(
      //               title: const Text("Coming Soon"),
      //               content: Text(''),
      //               actions: <Widget>[
      //                 ElevatedButton(
      //                   child: const Text("OK"),
      //                   onPressed: () {
      //                     Navigator.of(context).pop();
      //                   },
      //                 ),
      //               ],
      //             );
      //           },
      //         );
      //       },
      //       icon: Icon(
      //         Icons.notifications_none,
      //       ),
      //     ),
      //     ClipRRect(
      //       borderRadius: BorderRadius.all(Radius.circular(13)),
      //       child: Container(
      //         // height: 40,
      //         // width: 40,
      //         decoration: BoxDecoration(
      //           color: Theme.of(context).backgroundColor,
      //         ),
      //         child: Image.asset("assets/images/logo.png", fit: BoxFit.fill),
      //       ),
      //     ).p(8),
      //   ],
      // ),
      ,
      backgroundColor: Theme.of(context).backgroundColor,
      body: showBody(),
    );
  }

  CustomScrollView showBody() {
    {
      return CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [],
            ),
          ),
          _patientList()
        ],
      );
    }
  }
}
