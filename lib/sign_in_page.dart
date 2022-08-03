import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signinandsignup/logout.dart';
import 'package:signinandsignup/service/a_service.dart';
import 'package:signinandsignup/service/prefs_service.dart';
import 'package:signinandsignup/service/utils_service.dart';
import 'package:signinandsignup/sign_up_page.dart';

class SignIn extends StatefulWidget {
  static final String id = "sign";
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignState();
}

class _SignState extends State<SignIn> {
  final usernamecon = TextEditingController();
  final passwordcon = TextEditingController();

   _dologin(){
    String email = usernamecon.toString().trim();
    String password = passwordcon.toString().trim();
    if(email.isEmpty || password.isEmpty)
      return ;
    AuthService.signInUser(context, email, password).then((firebaseUser) => {
      getFirebaseUser(firebaseUser!),
    });

  }
  getFirebaseUser(FirebaseApp firebaseUser) async{
    if(firebaseUser != null){
      Prefs.saveUserId(firebaseUser.name);
      Navigator.pushReplacementNamed(context, LogOut.id);
    }else{
      Utils.fireToast("Email or password is incorrect! ");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150,),
              /// Image
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/images/ic_image9.jpg"),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Welcome Back!",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
              Text("Sign in to continue",style: TextStyle(fontSize: 16,color: Colors.white),),
              SizedBox(height: 50,),
              /// User Name
              Container(
                padding: EdgeInsets.only(left: 25,right: 25),
                child: TextField(
                  controller: usernamecon,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_outlined ,color: Colors.grey,),
                    fillColor: Colors.grey,
                    hintText: "User Name",
                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,letterSpacing: 0.6),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              /// Password
              Container(
                padding: EdgeInsets.only(left: 25,right: 25),
                child: TextField(
                  controller: passwordcon,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key_outlined ,color: Colors.grey,),
                    fillColor: Colors.grey,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,letterSpacing: 0.6),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              /// Forget
              Text("Forget password?",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
              SizedBox(height: 60,),
              /// Button
              ClipOval(
                child: Material(
                  color: Colors.blue,
                  child: InkWell(
                    splashColor: Colors.deepOrange,
                    onTap: _dologin,
                    child: SizedBox(width: 65, height: 65, child: Icon(Icons.trending_neutral,size: 40,color: Colors.white,)),
                  ),
                ),
              ),
              SizedBox(height: 130,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have  an account?",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,letterSpacing: 1),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, SignUp.id);
                    },
                    child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 18),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
