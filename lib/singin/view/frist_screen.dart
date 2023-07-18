import 'package:firebase_app/singin/utils/helper/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtEmail=TextEditingController();
  TextEditingController txtPassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      height:100.h,
      width: 100.w,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/img_1.png"),fit: BoxFit.fill)),
      
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () =>  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Singup",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: txtEmail,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70),
                          borderRadius: BorderRadius.circular(20)
                      ),label: Text("Email"),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: txtPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon:Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),label: Text("Password"),
                    ),
                  ),
                ),
                InkWell(onTap: () async {
                  // FirebaseHelper helper=FirebaseHelper();
                   //String mag=await FirebaseHelper auth.load();
                  String mag=await FirebaseHelper.helper.createUser(txtEmail.text, txtPassword.text);
                  Get.snackbar('succes', '',backgroundColor: mag=='Faild'?Colors.red.shade100:Colors.green.shade100);
                  if(mag=='succes')
                  {
                   Get.back();
                  }
                },
                    child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.purpleAccent.shade100),
                        child: Center(child: Text("Signup",style: TextStyle(color: Colors.white),)))),
                SizedBox(width: 30,),
                TextButton(onPressed: () {
                  Get.back();
                }, child: Text("Already have account"),),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
