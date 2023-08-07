import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import '../widgets/custom_Button.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final authMethods _authMethods = authMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
        Align(alignment: Alignment.center,child: Container(margin: const EdgeInsets.all(2),child: const Text("Start or join a meeting",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),))),
        Image.asset("assets/images/onboarding.jpg"),
        custom_Button(text: "Google Sign In",onPressed: ()async{bool res = await _authMethods.googleSignIn(context);
        if (res==true){
          Navigator.pushNamed(context,'/home');
        } 
        },)
        
      ]),
    );
  }
}