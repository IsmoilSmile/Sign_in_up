import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:signinandsignup/service/prefs_service.dart';
import '../sign_in_page.dart';

class AuthService{
  static final _auth = FirebaseAuth.instance;

  static Future<FirebaseApp?> signInUser(BuildContext context, String email, String password) async{
    try{
      _auth.signInWithEmailAndPassword(email: email, password: password);
      final FirebaseApp user = (await _auth.currentUser!) as FirebaseApp;
      print(user.toString());
      return user;
    }catch(e){
      print(e);
    }
    return null;
  }

  static Future<FirebaseApp?> signUpUser(BuildContext context, String name, String email, String password) async{
    try{
      var authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseApp user = authResult.user as FirebaseApp;
      print(user.toString());
      return user;
    }catch(e){
      print(e);
    }
    return null;
  }

  static void signLogOutUser(BuildContext context){
    _auth.signOut();
    Prefs.removeUserId().then((value) => {
      Navigator.pushReplacementNamed(context, SignIn.id),
    });
  }
}