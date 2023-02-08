
import 'package:cryptocurrency/projectContents/Appbar_des/thems.dart';
import 'package:cryptocurrency/projectContents/Auth_Screens/Register_Screen.dart';
import 'package:cryptocurrency/projectContents/Provider/Details_provider.dart';
import 'package:cryptocurrency/projectContents/Provider/Home_Provider.dart';
import 'package:cryptocurrency/projectContents/Provider/SearchProvider.dart';
import 'package:cryptocurrency/projectContents/Provider/auth_provider.dart';
import 'package:cryptocurrency/projectContents/Provider/photo_provider.dart';
import 'package:cryptocurrency/projectContents/Provider/thems_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';



Future<void> main() async {

  HomeProvider().getallcoin();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  HomeProvider().getallcoin();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ChangeNotifierProvider(create: (context) => DetailsProvider(),),
    ChangeNotifierProvider(create: (context) => Auth_Provider(),),
    ChangeNotifierProvider(create: (context) => ThemeProvider(),),
    ChangeNotifierProvider(create: (context) => SearchProvider(),),
    ChangeNotifierProvider(create: (context) => PhotoProvider(),),
  ],child:const MyApp() ,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: false).getThemeModeFromSharedPref();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        home:Register_Screen()
    );
  }
}

