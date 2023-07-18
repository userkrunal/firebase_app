import 'package:firebase_app/singin/controller/fir_controller.dart';
import 'package:firebase_app/singin/utils/helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirbaseController controller=Get.put(FirbaseController());

  @override
  void initState() {
    super.initState();
    controller.userditails.value=FirebaseHelper.helper.userditailes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  await FirebaseHelper.helper.signOut();
                  Get.offAllNamed('/sing');
                },
                child: Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.indigo.shade100),
                  child: Center(child: Text("Singout",style: TextStyle(fontSize: 20,color: Colors.white))),
                ),
              )
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(controller.userditails['photo']==null?"https://cdn-icons-png.flaticon.com/128/4140/4140048.png":"${controller.userditails['pohto']}"),
                radius: 50,
              ),
              SizedBox(height: 20),
               Text(controller.userditails['email']!=null?"${controller.userditails['email']}":"",style: TextStyle(fontSize: 25),),
              // SizedBox(height: 10),
              // Text("",style: TextStyle(fontSize: 18)),
              // SizedBox(height: 10),
              // Text("",style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    ));
  }
}
