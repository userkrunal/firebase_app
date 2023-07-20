import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/singin/model/fr_model.dart';
import 'package:firebase_app/singin/utils/helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseHelper.helper.readProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Center(child: Text("${snapshot.error}"));
        } else if (snapshot.hasData) {
          QuerySnapshot qs = snapshot.data!;
          List<QueryDocumentSnapshot> qList = qs.docs;

          Map m1 = {};
          List<ProductModel> productList = [];

          for (var x in qList) {
            m1 = x.data() as Map;
            String id = x.id;
            String name = m1['name'];
            String category = m1['category'];
            String price = m1['price'];
            // String photo=m1['photo'];
            String description = m1['desc'];
            ProductModel model = ProductModel(
              price: price,
              name: name,
              category: category,
              desc: description,
              id: id,
            );
            productList.add(model);
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisExtent: 222),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 320,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 95,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(productList[index].photo !=
                                        null
                                    ? "${productList[index].photo}"
                                    : "https://m.media-amazon.com/images/I/71lG7br7k1L._SX679_.jpg"),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${productList[index].name}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "\$ ${productList[index].price}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                          Text(
                            "${productList[index].category}",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                               // print(productList[index].id);
                                FirebaseHelper.helper
                                    .deleteData("${productList[index].id}");
                              },
                              icon: Icon(Icons.delete,size: 20,)),
                          IconButton(
                              onPressed: () {
                                Get.toNamed('/update',arguments: productList[index]);
                              },
                              icon: Icon(Icons.edit,size: 20,)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: productList.length,
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
