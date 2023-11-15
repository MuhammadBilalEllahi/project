import 'package:flutter/material.dart';
import 'package:project/Auth/Login%20Page/login.dart';
import 'package:project/Auth/Registration%20Page/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
    print(showLoginPage);
    showLoginPage = !showLoginPage;
    print(showLoginPage);
      
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
          print(showLoginPage);

      return LoginPage(showRegisterPage: togglePage);
    }
    else{
          print(showLoginPage);

      return  RegisterPage(showLoginPage: togglePage);
    }
  }
}