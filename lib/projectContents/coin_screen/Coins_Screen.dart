
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Auth_Screens/Details_Screen.dart';
import '../Auth_Screens/profile_Screen.dart';
import '../Auth_Screens/search_screen.dart';
import '../Provider/Details_provider.dart';
import '../Provider/Home_Provider.dart';

// ignore: camel_case_types
class Coins_Screen extends StatelessWidget {
  const Coins_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<HomeProvider>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text("Crypto Currency",style: TextStyle(color: Colors.white),),
          actions: [
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.arrow_back)),
            IconButton(onPressed: () {
              Get.to(SearchScreen());
            }, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {
              Get.to(const Profile_Screen());
            }, icon: const Icon(Icons.face)),
          ],
        ),
        body:ListView.builder(
          itemCount: prov.coinlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child:GestureDetector(
                onTap: () {
                  Provider.of<DetailsProvider>(context,listen: false).getallcoin(prov.coinlist[index].id);
                  Get.to(Details_Screen(id: prov.coinlist[index].id,));
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                  child: Card(
                    elevation: 2,
                    color: Colors.red,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(prov.coinlist[index].rank.toString(),style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        Image.network(prov.coinlist[index].image,width: 50,height: 50,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(prov.coinlist[index].name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                              Text(prov.coinlist[index].symbol,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                        ),
                        const SizedBox(width: 50,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(prov.coinlist[index].current_price.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white)),
                               Text(prov.coinlist[index].pricechange.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.green)),
                              Text(prov.coinlist[index].pricechange_percentage.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red))

                            ],
                          ),
                        )
                      ],

                    ),
                  ),
                ),
              ),
            );
          },)
    );
  }
}