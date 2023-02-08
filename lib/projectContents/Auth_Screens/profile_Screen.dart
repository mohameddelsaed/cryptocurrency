
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../Provider/auth_provider.dart';
import '../Provider/photo_provider.dart';
import '../Provider/thems_provider.dart';


// ignore: camel_case_types
class Profile_Screen extends StatelessWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userprovider =Provider.of<Auth_Provider>(context);
    var profileimage = Provider.of<PhotoProvider>(context).imagefile;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius:20,
              // ignore: unnecessary_null_comparison
              backgroundImage:userprovider.user.image==null?FileImage(profileimage!)as ImageProvider:NetworkImage(userprovider.user.image),
            ),
          ),
          const SizedBox(height: 20),
          // ignore: prefer_const_constructors
           Text("Mohamedsaeed72@gmail.com"),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context).saveThemeModeToSharedPref(ThemeMode.dark);
            },
            child: const Text("Dark"),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context).saveThemeModeToSharedPref(ThemeMode.light);
            },
            child: const Text("Light"),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context).saveThemeModeToSharedPref(ThemeMode.system);
            },
            child: const Text("System"),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<PhotoProvider>(context,listen: false).getimage(ImageSource.camera);
            },
            child: const Text("Add Cam",)

          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<PhotoProvider>(context,listen: false).getimage(ImageSource.gallery);
            },
            child: const Text(" From Gallery "),
          ),
        ],
      ),
    );
  }
}