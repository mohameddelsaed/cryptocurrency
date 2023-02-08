
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Appbar_des/thems.dart';
import '../Provider/Details_provider.dart';
import '../Provider/SearchProvider.dart';
import 'Details_Screen.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {

  var text = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, value, child) {
      // ignore: prefer_is_empty
      return value.searchlist.length<0?const CircularProgressIndicator():Scaffold(
        backgroundColor: Themes.isDarkMode(context)?Colors.black:Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 100,
          title: TextFormField(
            controller: text,
            onChanged: (index) {
              value.getsearch(index);
            },

            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded,color: Colors.red,),
              hintText: "Search for a coin",
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
              ),
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

              ),
            ),
          ),
        ),
        body:value.searchlist.isEmpty?Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/loupe-search-svgrepo-com.svg',width: 150,height: 150,),
            const Text("Search for a coin",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
          ],
        )):ListView.separated(
          separatorBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 1.5,
              color: Colors.black,
            );
          },
          itemCount: value.searchlist.length,
          itemBuilder:(context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {

                  Provider.of<DetailsProvider>(context, listen: false)
                      .getallcoin(value.searchlist[index].id);
                  Get.to(Details_Screen(id: value.searchlist[index].id));
                },
                child: Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.cyan),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.network(
                          value.searchlist[index].image,
                          width: 50,
                          height: 50,
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.searchlist[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  value.searchlist[index].symbol,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                "Rank",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text(
                              value.searchlist[index].rank.toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    },);
  }
}
