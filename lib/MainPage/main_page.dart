import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/Auth/auth_page.dart';
import 'package:project/Logged%20In%20Page/loggedin.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context,snapshot) { 
        
        if(snapshot.hasData){
          return const HomePage();
        }
        else{
          return const AuthPage();
        }
       },),
    );
  }
}