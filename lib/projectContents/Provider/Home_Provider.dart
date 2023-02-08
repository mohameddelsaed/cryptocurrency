import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/Home_Model.dart';
import '../Network/coin_api.dart';
import '../Network/dio_exceptions (1).dart';

class HomeProvider extends ChangeNotifier {
  List<Home_Model> coinlist = [];
  HomeProvider(){
    getallcoin();
  }
  getallcoin() async {
    try {
      await CoinApi().getdata().then((value) {
        coinlist = value;
        if (kDebugMode) {
          print(value);
        }
        notifyListeners();
      });
    }
    on DioError catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      if (kDebugMode) {
        print(error);
      }
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: Text(error),
          actions: [
            TextButton(onPressed: () {
              getallcoin();
              Get.back();
            },
              child: const Text("ok"),
            ),
          ],
        ),
      );
    }
  }
}