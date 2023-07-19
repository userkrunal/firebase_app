import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/singin/model/fr_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper {
  static FirebaseHelper helper = FirebaseHelper();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  Future<String> load() async {

    try {
      await auth.signInAnonymously();
      return "succes";
    }
    catch (e) {
      return "Faild";
    }
  }

  bool chakuser()
  {
    User? user=auth.currentUser;
    return user!=null;
  }

  Future<void> signOut()
  async {
    await auth.signOut();
  }

  Future<String> createUser(String email,String password)
  async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "succes";
    }catch(e)
    {
      return "$e";
    }

  }


  Future<String> signIn(String email,String password)
  async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "succes";
    }catch(e)
    {
      return "$e";
    }
  }

  Future<String> googleSignIn()
  async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try{
      await auth.signInWithCredential(credential);
      return "succes";
    }catch(e)
    {
      return "$e";
    }
  }

  Map<String, String?> userditailes()
  {
    User? user=auth.currentUser;
    var email=user!.email;
    var name=user.displayName;
    var number=user.phoneNumber;
    var photo=user.photoURL;
    return {"email":email,"name":name,"number":number,"photo":photo};
  }
  /*=============Firebasem Firestore*/

  void addproduct(ProductModel model)
  {
    firestore.collection("Product").add({
      "name":model.name,
      "price":model.price,
      "category":model.category,
      "desc":model.desc,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readProduct()
  {
    return firestore.collection("Product").snapshots();
  }




}