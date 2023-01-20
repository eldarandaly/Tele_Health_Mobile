import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';
import 'signin.dart';
import 'package:telehealthcare/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (BuildContext context, child) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
    ),
  ));
}
