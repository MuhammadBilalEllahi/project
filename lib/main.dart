import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/MainPage/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
       apiKey: "AIzaSyB8c9oDWVNND0mM2UCy1nvK-QP11ltMskE",
  authDomain: "mad-poject.firebaseapp.com",
  projectId: "mad-poject",
  storageBucket: "mad-poject.appspot.com",
  messagingSenderId: "730271059087",
  appId: "1:730271059087:web:3532efc7a6205cea7df4fa"
        )
  ); 
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}
