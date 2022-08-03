import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signinandsignup/service/a_service.dart';
import 'package:signinandsignup/service/prefs_service.dart';
import 'package:signinandsignup/service/utils_service.dart';
import 'package:signinandsignup/sign_in_page.dart';
import 'logout.dart';

class SignUp extends StatefulWidget {
  static final String id = "sign_up";
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final namecon = TextEditingController();
  final emailcon = TextEditingController();
  final passwordcon = TextEditingController();


  void _doSign(){
    String name = namecon.toString().trim();
    String email = emailcon.toString().trim();
    String password = passwordcon.toString().trim();
    if(name.isEmpty || email.isEmpty || password.isEmpty)
      return;
    AuthService.signUpUser(context, name, email, password).then((firebaseUser) => {
      getFirebaseUser(firebaseUser!),
    });

  }
  getFirebaseUser(FirebaseApp firebaseUser) async{
    if(firebaseUser != null){
      Prefs.saveUserId(firebaseUser.name);
      Navigator.pushReplacementNamed(context, LogOut.id);
    }else{
      Utils.fireToast("Try again check information! ");
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
              Text("Create",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
              Text("Account",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
              SizedBox(height: 50,),
              /// User Name
              Container(
                padding: EdgeInsets.only(left: 25,right: 25),
                child: TextField(
                  controller: namecon,
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
                  controller: emailcon,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined ,color: Colors.grey,),
                    fillColor: Colors.grey,
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,letterSpacing: 0.6),
                  ),
                ),
              ),

              SizedBox(height: 20,),
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
              SizedBox(height: 50,),
              /// Button
              ClipOval(
                child: Material(
                  color: Colors.blue,
                  child: InkWell(
                    splashColor: Colors.deepOrange,
                    onTap: _doSign,
                    child: SizedBox(width: 65, height: 65, child: Icon(Icons.trending_neutral,size: 40,color: Colors.white,)),
                  ),
                ),
              ),
              SizedBox(height: 112,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Alrady have  an account",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,letterSpacing: 1),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, SignIn.id);
                    },
                    child: Text("Sign In",style: TextStyle(color: Colors.blue,fontSize: 18),),
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
