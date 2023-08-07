
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:video_call_app/utils/utils.dart';

class authMethods{
  final FirebaseAuth _Auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authChanges => _Auth.authStateChanges();
  Future<bool> googleSignIn(BuildContext context)async{
    bool res=false;
    try {
  final result = await InternetAddress.lookup('example.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    print('connected');
  }
} on SocketException catch (_) {
  showsnackBar(context,"Internet not connected - ERROR 404");
}
    try{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken);    
    UserCredential userCredential = await _Auth.signInWithCredential(credential);

    User? user = userCredential.user;
    if(user!=null){
      if(userCredential.additionalUserInfo!.isNewUser){
        await _firestore.collection('users').doc(user.uid).set({
          "username":user.displayName,
          "userid":user.uid,
          "profilephoto":user.photoURL,
        });

      }
      res= true;
      return res;
    }else{return false;}

    }on FirebaseAuthException catch(e){

      showsnackBar(context,e.message!);
      return false;
    }

  }
}