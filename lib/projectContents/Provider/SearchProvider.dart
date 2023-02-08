import 'package:flutter/foundation.dart';
import '../Models/Search_Model.dart';
import '../Network/coin_api.dart';

class SearchProvider extends ChangeNotifier{
  List<Search_Model> searchlist = [];

  getsearch(String name){
    CoinApi().getsearchdata(name).then((value) {
      searchlist=value;
      if (kDebugMode) {
        print(searchlist[0].name);
      }
      notifyListeners();
    }).catchError((error){
      if (kDebugMode) {
        print(error);
      }
    });
  }

}