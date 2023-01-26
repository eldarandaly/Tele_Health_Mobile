import 'package:telehealthcare/drawer/custom_drawer.dart';
import 'package:telehealthcare/drawer_screens/make_appoiment.dart';
import 'dart:math';
import 'package:telehealthcare/drawer/custom_drawer.dart';

import 'package:flutter/material.dart';
import 'package:telehealthcare/new_home/src/model/patient%20_model.dart';
import 'package:telehealthcare/new_home/src/model/dactor_model.dart';

import 'package:telehealthcare/new_home/src/model/data.dart';
import 'package:telehealthcare/new_home/src/theme/extention.dart';
import 'package:telehealthcare/new_home/src/theme/light_color.dart';
import 'package:telehealthcare/new_home/src/theme/text_styles.dart';
import 'package:flutter/material.dart';

class DoctorsOnlyPage extends StatefulWidget {
  @override
  _DoctorsOnlyPage createState() => _DoctorsOnlyPage();
}

class _DoctorsOnlyPage extends State<DoctorsOnlyPage> {
  final _formKey = GlobalKey<FormState>();
  late String _text;
  late List<DoctorModel> doctorDataList;
  late List<PatientModel> patientDataList;
  @override
  void initState() {
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
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

  Widget _doctorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Doctors", style: TextStyles.title.bold),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Coming Soon"),
                          content: Text(''),
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
                  })
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
      return _doctorTile(x);
    }).toList());
  }

  Widget _doctorTile(DoctorModel model) {
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
              // height: 150,
              // width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.asset(
                model.image,
                // height: 200,
                // width: 150,
                fit: BoxFit.fitHeight,
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
        toolbarHeight: 100,
        title: const Text("Tele Health",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      // bottomNavigationBar: BottomNavigationBar(items: []),
      drawer: CustomDrawer(),
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
          _doctorsList()
        ],
      );
    }
  }
}
