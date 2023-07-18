import 'dart:async';

import 'package:firebase_app/singin/utils/helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4),() {
      FirebaseHelper.helper.auth.currentUser==null
      ?Get.toNamed('/sing'):Get.toNamed('/home');
    },);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/img.png"),fit: BoxFit.cover)),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
