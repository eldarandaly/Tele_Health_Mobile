import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:telehealthcare/API/api_calls.dart';
import 'package:telehealthcare/check_herat/chechk_heart_screen.dart';
import 'package:telehealthcare/sign_up_transition.dart';
import 'package:telehealthcare/size_config.dart';
import 'package:telehealthcare/user_data.dart';
import 'package:telehealthcare/profile/profile_body.dart';
import 'dart:convert';
import 'heart_readings/enter_heart_values.dart';
import 'heart_readings/heart_chart.dart';
import 'new_home/home_main.dart';

String globleE = '';
final body = {
  "data": [40, 0, 1, 140, 289, 0, 0, 172, 1, 0, 1]
};
Api api = Api();

class HomePage extends StatelessWidget {
  final MyUser u;
  const HomePage({Key? key, required this.u}) : super(key: key);
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

class ApiPage extends StatelessWidget {
  final String thisEmail;
  ApiPage({Key? key, required this.thisEmail});
  @override
  Widget build(BuildContext context) {
    // FirebaseAPI d = FirebaseAPI(serachEmail: thisEmail);
    // d.getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Body(),
    );
  }
}

class DisplayProfile extends StatelessWidget {
  final List<String> texts;

  const DisplayProfile({required this.texts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(texts.length, (index) {
        return Container(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  texts[index],
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" ",
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w800)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (BuildContext context) => const PredictPage(),
                settings: settings,
              );
            },
          ),
          Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (BuildContext context) => const TestThisClass(),
                settings: settings,
              );
            },
          ),
          Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (BuildContext context) => HeartReadingPage(),
                settings: settings,
              );
            },
          ),
          MyApp(),
          Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (BuildContext context) => HeartRateLineChart(),
                settings: settings,
              );
            },
          ),
          Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (BuildContext context) => ApiPage(
                  thisEmail: globleE,
                ),
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
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'You check'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken), label: 'Heart.ai'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.edit_note_rounded), label: 'Readings'),
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.monitor_heart_outlined), label: 'Chart'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp), label: 'Profile'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
    );
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
//                         builder: (context) => ApiPage(
//                               thisEmail: u.email,
//                             )),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),

