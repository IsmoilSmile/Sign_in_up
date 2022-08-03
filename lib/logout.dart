import 'package:flutter/material.dart';
import 'package:signinandsignup/service/a_service.dart';
class LogOut extends StatefulWidget {
  static final String id = "logout";
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log Out "),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          AuthService.signLogOutUser(context);
        },
        child: Text("Log out!"),),
      ),
    );
  }
}
