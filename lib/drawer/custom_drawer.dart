import 'package:telehealthcare/drawer_screens/Patients_only_screen.dart';
import 'package:telehealthcare/drawer_screens/doctors_only_page.dart';
import 'package:telehealthcare/drawer_screens/gradines_page.dart';
import 'package:telehealthcare/drawer_screens/how2use.dart';
import 'package:telehealthcare/drawer_screens/see_patients_data.dart';
import 'package:telehealthcare/heart_readings/heart_chart.dart';
import 'package:telehealthcare/home_page.dart';
import 'package:telehealthcare/new_home/home_main.dart';
import 'package:telehealthcare/signin.dart';
import 'package:telehealthcare/user_data.dart';

import './bottom_user_info.dart';
import './custom_list_tile.dart';
import './header.dart';
import 'package:flutter/material.dart';
import 'package:telehealthcare/drawer_screens/make_appoiment.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    if (WhatUser.isAdoctor == true) {
      return SafeArea(
        child: AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: const Duration(milliseconds: 300),
          width: _isCollapsed ? 300 : 70,
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Color.fromRGBO(20, 20, 20, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomDrawerHeader(isColapsed: _isCollapsed),
                const Divider(
                  color: Colors.grey,
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.home_outlined),
                  title: 'Home',
                  infoCount: 0,
                  x: HomePage(),
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.calendar_today),
                  title: 'Calender',
                  infoCount: 0,
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.pin_drop),
                  title: 'Work Location',
                  infoCount: 0,
                  doHaveMoreOptions: Icons.arrow_forward_ios,
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.notifications_active),
                  title: 'Reminders',
                  infoCount: 3,
                ),
                CustomListTile(
                    isCollapsed: _isCollapsed,
                    icon: Icon(Icons.sick),
                    title: 'Patients HR',
                    infoCount: 0,
                    doHaveMoreOptions: Icons.arrow_forward_ios,
                    x: PatientsDataForDoctor()),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.medical_services),
                  title: 'My Patients',
                  infoCount: 0,
                  doHaveMoreOptions: Icons.arrow_forward_ios,
                  x: PatientsPageDraw(),
                ),
                const Divider(color: Colors.grey),
                const Spacer(),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.notifications),
                  title: 'Notifications',
                  infoCount: 8,
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: const Icon(Icons.settings),
                  title: 'How to Use Ecg Device',
                  infoCount: 0,
                  x: How2use(),
                ),
                const SizedBox(height: 10),
                BottomUserInfo(isCollapsed: _isCollapsed),
                Align(
                  alignment: _isCollapsed
                      ? Alignment.bottomRight
                      : Alignment.bottomCenter,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    icon: Icon(
                      _isCollapsed
                          ? Icons.arrow_back_ios
                          : Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: () {
                      setState(() {
                        _isCollapsed = !_isCollapsed;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: const Duration(milliseconds: 300),
          width: _isCollapsed ? 300 : 70,
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Color.fromRGBO(20, 20, 20, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomDrawerHeader(isColapsed: _isCollapsed),
                const Divider(
                  color: Colors.grey,
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.home_outlined),
                  title: 'Home',
                  infoCount: 0,
                  x: HomePage(),
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.calendar_today),
                  title: 'Calender',
                  infoCount: 0,
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.pin_drop),
                  title: 'Doctor Location',
                  infoCount: 0,
                  doHaveMoreOptions: Icons.arrow_forward_ios,
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.notifications_active),
                  title: 'Reminders',
                  infoCount: 8,
                ),
                CustomListTile(
                    isCollapsed: _isCollapsed,
                    icon: Icon(Icons.shield_rounded),
                    title: 'Grendians',
                    infoCount: 0,
                    doHaveMoreOptions: Icons.arrow_forward_ios,
                    x: GradPage()),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.medical_services),
                  title: 'Doctors',
                  infoCount: 0,
                  doHaveMoreOptions: Icons.arrow_forward_ios,
                  x: DoctorsOnlyPage(),
                ),
                const Divider(color: Colors.grey),
                const Spacer(),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icon(Icons.notifications),
                  title: 'Notifications',
                  infoCount: 2,
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: const Icon(Icons.help_sharp),
                  title: 'How to Use Ecg Device',
                  infoCount: 0,
                  x: How2use(),
                ),
                const SizedBox(height: 10),
                BottomUserInfo(isCollapsed: _isCollapsed),
                Align(
                  alignment: _isCollapsed
                      ? Alignment.bottomRight
                      : Alignment.bottomCenter,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    icon: Icon(
                      _isCollapsed
                          ? Icons.arrow_back_ios
                          : Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: () {
                      setState(() {
                        _isCollapsed = !_isCollapsed;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
