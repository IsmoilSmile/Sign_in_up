
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signinandsignup/logout.dart';
import 'package:signinandsignup/sign_in_page.dart';
import 'package:signinandsignup/sign_up_page.dart';

void main()  async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
      routes: {
        SignUp.id: (context) => SignUp(),
        SignIn.id: (context) => SignIn(),
        LogOut.id: (context) => LogOut(),
      },
    );
  }
}