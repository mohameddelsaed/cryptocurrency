
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Provider/auth_provider.dart';
import 'Register_Screen.dart';

// ignore: camel_case_types
class  Login_Screen extends StatelessWidget {
  const Login_Screen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var email = TextEditingController();
    var password = TextEditingController();


    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sign in",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
              const Text("Welcome Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
              const SizedBox(height: 20,),
              TextFormField(
                controller: email,
                validator: (value) {
                  if(value!.isEmpty || !value.contains("@")){
                    return "Please enter your email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  label: const Text('Email',style: TextStyle(color: Colors.teal),),
                  prefixIcon: const Icon(Icons.email,color: Colors.grey,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),

                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: password,
                validator: (value) {
                  if(value!.isEmpty || value.length < 3){
                    return "Please enter your password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter Password',
                  label: const Text('Password',style: TextStyle(color: Colors.teal)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.lock,color: Colors.grey,),
                  suffixIcon: const Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                      Provider.of<Auth_Provider>(context,listen: false).login(email: email.text, password: password.text);
                    }
                  },
                  child: const Text('Sign in',style: TextStyle(fontSize: 20),),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?', style: TextStyle(color: Colors.red)),
                  TextButton(
                    onPressed: () {
                      Get.to(Register_Screen());
                    },
                    child: const Text('Sign Up'),

                  ),
                ],
              ),
              // Sign in with google logo
              const SizedBox(height: 40,),
              GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/1.jpg',height:30 ,),
                        const SizedBox(width: 10,),
                        const Text('Sign in with Google'),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
