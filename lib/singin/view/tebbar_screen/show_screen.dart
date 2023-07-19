import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/singin/model/fr_model.dart';
import 'package:firebase_app/singin/utils/helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseHelper.helper.readProduct(),
    builder: (context, snapshot) {
      if(snapshot.hasError)
        {
          Center(child: Text("${snapshot.error}"));
        }
      else if(snapshot.hasData)
        {
          QuerySnapshot qs=snapshot.data!;
          List<QueryDocumentSnapshot>qList=qs.docs;

          Map m1={};
          List<ProductModel> productList=[];

          for( var x in qList)
            {
              m1=x.data() as Map;
              String id=x.id;
              String name=x['name'];
              String category=x['category'];
              String price=x['price'];
              String photo=x['photo'];
              String description=x['description'];
              ProductModel model=ProductModel(price: price,name: name,category: category,desc: description,id:id,photo: photo);
              productList.add(model);
            }
          return ListView.builder(itemBuilder: (context, index) {
            return Container(
              height: 150,
              width: 100.w,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.indigoAccent.shade100),
              child: Row(children: [
                SizedBox(width: 10,),
                ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(productList[index].photo != null ? "${productList[index].photo}": "https://images.freeimages.com/images/previews/ac9/railway-hdr-1361893.jpg",height: 135,width: 120,fit: BoxFit.contain,),),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text("${productList[index].name}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                    SizedBox(height: 15,),
                    Text("\$ ${productList[index].price}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                    Spacer(),
                    Text("${productList[index].category}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                    SizedBox(height: 20,),
                  ],)

              ],),
            );
          },);
        }

      return Center(child: CircularProgressIndicator());
    },);
  }
}
