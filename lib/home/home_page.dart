import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:telehealthcare/API/api_calls.dart';
import 'package:telehealthcare/check_herat/chechk_heart_screen.dart';
import 'package:telehealthcare/drawer/custom_drawer.dart';
import 'package:telehealthcare/firebase_options.dart';
import 'package:telehealthcare/heart_readings/heart_chart_test.dart';
import 'package:telehealthcare/regestier/sign_up_transition.dart';
import 'package:telehealthcare/size_config.dart';
import 'package:telehealthcare/user_data.dart';
import 'package:telehealthcare/profile/profile_body.dart';
import 'dart:convert';
import '../heart_readings/enter_heart_values.dart';
import '../heart_readings/heart_chart.dart';
import '../bottom_bar_nav/home_main.dart';

String globleE = '';
final body = {
  "data": [40, 0, 1, 140, 289, 0, 0, 172, 1, 0, 1]
};
Api api = Api();

class HomePage extends StatelessWidget {
  // final MyUser u;
  // const HomePage({Key? key, required this.u}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
      ),
    );
  }
}

class ProfilePageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 2;
  int _webCurrentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _webCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    if (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.web) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          foregroundColor: Colors.black,
          leadingWidth: 50,
          toolbarHeight: 75,
          title: const Text("Tele Health",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800)),
          backgroundColor: Colors.blue,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        drawer: CustomDrawer(),
        body: IndexedStack(
          index: _webCurrentIndex,
          children: <Widget>[
            // Navigator(
            //   onGenerateRoute: (RouteSettings settings) {
            //     return MaterialPageRoute(
            //       builder: (BuildContext context) => new PredictPage(),
            //       settings: settings,
            //     );
            //   },
            // ),
            // Navigator(
            //   onGenerateRoute: (RouteSettings settings) {
            //     return MaterialPageRoute(
            //       builder: (BuildContext context) => new TestThisClass(),
            //       settings: settings,
            //     );
            //   },
            // ),
            Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => HeartRateLineChart(),
                  settings: settings,
                );
              },
            ),
            MyApp(),
            Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => HeartRateLineChart2(),
                  settings: settings,
                );
              },
            ),
            Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePageClass(),
                  settings: settings,
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _webCurrentIndex,
          onTap: (int index) {
            setState(() {
              _webCurrentIndex = index;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            // const BottomNavigationBarItem(
            //     icon: Icon(Icons.favorite), label: 'You check'),
            // const BottomNavigationBarItem(
            //     icon: Icon(Icons.heart_broken), label: 'Heart.ai'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Heart Readings'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.monitor_heart_outlined), label: 'Ecg Chart'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp), label: 'Profile'),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
        ),
      );
    } else {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // leadingWidth: 50,

          foregroundColor: Colors.black,
          toolbarHeight: 75,
          title: const Text("Tele Health",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800)),
          backgroundColor: Colors.blue,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        drawer: CustomDrawer(),
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            // Navigator(
            //   onGenerateRoute: (RouteSettings settings) {
            //     return MaterialPageRoute(
            //       builder: (BuildContext context) =>
            //           PredictPage(), //new ECGChart(),
            //       settings: settings,
            //     );
            //   },
            // ),
            Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => TestThisClass(),
                  settings: settings,
                );
              },
            ),
            Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => HeartRateLineChart(),
                  settings: settings,
                );
              },
            ),
            MyApp(),
            Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => HeartRateLineChart2(),
                  settings: settings,
                );
              },
            ),
            Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePageClass(),
                  settings: settings,
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            // const BottomNavigationBarItem(
            //     icon: Icon(Icons.favorite), label: 'You check'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken_outlined), label: 'Smart Check'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Heart Readings'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.monitor_heart_outlined), label: 'Ecg Chart'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp), label: 'Profile'),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
        ),
      );
    }
  }
}

// Column(

//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PredictPage()),
//                     );
//                   },
//                   child: const Text('check Heart')),
//               const SizedBox(width: 20.0),
//               ElevatedButton(
//                 child: const Text('Go to Heart Reading Page'),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => HeartRateLineChart()),
//                   );
//                 },
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 child: const Text('Enter Heart Data'),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HeartReadingPage()),
//                   );
//                 },
//               ),
//               const SizedBox(width: 20.0),
//               ElevatedButton(
//                 child: const Text('Profile'),
//                 onPressed: () {
//                   globleE = u.email;
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => ProfilePageClass(
//                               thisEmail: u.email,
//                             )),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),

