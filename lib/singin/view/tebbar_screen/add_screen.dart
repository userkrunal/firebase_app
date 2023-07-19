import 'package:firebase_app/singin/model/fr_model.dart';
import 'package:firebase_app/singin/utils/helper/firebase_helper.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  category: txtCategory.text,
                  name: txtName.text,
                  price: txtPrice.text,
                  desc: txtDescription.text);
              FirebaseHelper.helper.addproduct(m1);
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.indigoAccent.shade100),
              alignment: Alignment.center,
              child: Text(
                "Add",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
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
