import 'package:firebase_app/singin/view/frist_screen.dart';
import 'package:firebase_app/singin/view/home_screen.dart';
import 'package:firebase_app/singin/view/singin_screen.dart';
import 'package:firebase_app/singin/view/splash_screen.dart';
import 'package:firebase_app/singin/view/tebbar_screen/updet_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
         '/':(p0) =>SplashScreen(),
          '/sing':(p0) =>SigninScreen(),
          //'/':(p0) =>SinginScreen(),
          '/home':(p0) =>HomeScreen(),
          '/signup':(p0) =>SignUpScreen(),
          '/update':(p0) =>UpdateScreen(),
        },
      );
    },)
  );
}

