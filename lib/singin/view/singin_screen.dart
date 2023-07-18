import 'package:firebase_app/singin/utils/helper/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController txtEmail=TextEditingController();
  TextEditingController txtPassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      height:100.h,
      width: 100.w,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/img_1.png"),fit: BoxFit.fill)),
      //
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Singin",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: txtEmail,
                    decoration: InputDecoration(
                      // focusColor: Colors.white70,
                      // hoverColor: Colors.white70,
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
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 60,),
                    InkWell(onTap: () async {
                      String msg=await FirebaseHelper.helper.signIn(txtEmail.text, txtPassword.text);

                      if(msg=='succes')
                        {
                          Get.offAllNamed('/home');
                        }
                      Get.snackbar('$msg','',backgroundColor: msg=="succes"?Colors.green:Colors.red );
                    }, child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.purpleAccent.shade100),
                        child: Center(child: Text("Singin",style: TextStyle(color: Colors.white),)))),
                    SizedBox(width: 20),
                    InkWell(onTap: () async {
                      FirebaseHelper helper=FirebaseHelper();
                      // String mag=await FirebaseHelper auth.load();
                      String mag=await helper.load();
                      Get.snackbar('succes', '',backgroundColor: mag=='Faild'?Colors.red.shade100:Colors.green.shade100);
                      if(mag=='succes')
                      {
                        Get.toNamed('/home');
                      }
                    },
                        child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.purpleAccent.shade100),
                        child: Center(child: Text("Guest",style: TextStyle(color: Colors.white),)))),
                    SizedBox(width: 30,),
                    InkWell(
                      onTap: () async {
                        String msg=await FirebaseHelper.helper.googleSignIn();
                        Get.snackbar('$msg','',backgroundColor: msg=="succes"?Colors.green:Colors.red );
                        if(msg=="succes")
                        {
                          Get.toNamed('/sign');
                        }
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/img_3.png",),fit: BoxFit.cover)),
                      ),
                    )

                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {

                    Get.toNamed('/signup');
                  },
                    child: Text("Creat a new new account! ",style: TextStyle(color: Colors.black),)),

                
              ],
            ),
          ),
        ),
    ),
    );
  }
}
