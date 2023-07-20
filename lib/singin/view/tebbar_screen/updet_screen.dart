import 'package:firebase_app/singin/model/fr_model.dart';
import 'package:firebase_app/singin/utils/helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}


class _UpdateScreenState extends State<UpdateScreen> {

  String? id;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtDescription = TextEditingController();


  @override
  void initState() {
    super.initState();
    ProductModel m1=Get.arguments;
    id=m1.id;
    txtName=TextEditingController(text: m1.name);
    txtCategory=TextEditingController(text: m1.category);
    txtPrice=TextEditingController(text: m1.price);
    txtDescription=TextEditingController(text: m1.desc);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Update"),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CustomTextField(
                  hint: "Name", controller: txtName, kboard: TextInputType.text),
              SizedBox(height: 10),
              CustomTextField(
                  hint: "Price",
                  controller: txtPrice,
                  kboard: TextInputType.number),
              SizedBox(height: 10),
              CustomTextField(
                  hint: "Category",
                  controller: txtCategory,
                  kboard: TextInputType.text),
              SizedBox(height: 10),
              CustomTextField(
                  hint: "Description",
                  controller: txtDescription,
                  kboard: TextInputType.text),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  ProductModel m1 = ProductModel(
                      id: id,
                      category: txtCategory.text,
                      name: txtName.text,
                      price: txtPrice.text,
                      desc: txtDescription.text);
                  FirebaseHelper.helper.updateData(m1);
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.indigoAccent.shade100),
                  alignment: Alignment.center,
                  child: Text(
                    "Update",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

CustomTextField({controller, hint, kboard}) {
  return TextField(
    controller: controller,
    keyboardType: kboard,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      label: Text("Product $hint"),
    ),
  );
}
