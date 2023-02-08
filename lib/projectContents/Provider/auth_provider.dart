import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Auth_Models/User_Models.dart';
import '../coin_screen/Coins_Screen.dart';


// ignore: camel_case_types
class Auth_Provider extends ChangeNotifier{
  // ignore: non_constant_identifier_names
  FirebaseAuth login_auth = FirebaseAuth.instance;
  FirebaseFirestore database = FirebaseFirestore.instance;

  void login({ required String email ,required String password})async{
    try{
    await login_auth.createUserWithEmailAndPassword(email: email, password: password);
    Get.to(const Coins_Screen());
    }
    catch(e){
      Get.snackbar("login error", e.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.red);
    }
  }

  void register({required String email ,required String password,required String name})async{
    try{
    await login_auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      if (kDebugMode) {
        print(value);
      }
      saveuser(value, name);
    });
    Get.offAll(const Coins_Screen());
    }
    catch(e){
      Get.snackbar("Sign up error", e.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.red);

    }
  }

  void saveuser(UserCredential user,String name)async{
    UserModel userModel = UserModel(name: name, email: "", userId: user.user!.uid, image: '');
    await database.collection("users").doc(user.user!.uid).set(userModel.toJson());
  }
  getuser()async{
    await database.collection('users').doc(login_auth.currentUser!.uid).get().then((value) {
      user = UserModel.fromJson(value.data()!);
      notifyListeners();
    });
  }
  UserModel user = UserModel(name: '', email: "", userId: "",image: "");
}