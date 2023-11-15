import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Auth/Common/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
    final _emailEditingController = TextEditingController();
      final _formKey = GlobalKey<FormState>();

      Future passwordReset() async{
        try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailEditingController.text.trim());
 // ignore: use_build_context_synchronously
 showDialog(context: context, builder: (context){
            return  const AlertDialog(
              content: Text("Password Email Link Sent! Check Your Email"),
            );
          });
        } catch (e) { 
          print(e); 
           // ignore: use_build_context_synchronously
          showDialog(context: context, builder: (context){
            return  AlertDialog(
              content: Text(e.toString()),
            );
          });
        }
      } 

 @override
  void dispose() {
    // TODO: implement dispose
    _emailEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/login.json',
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text("Enter Your Email and We will send you a password reset Link", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      
                    ),),
                  ),
              Form(
                key: _formKey,
                child: myTextField(
                  textEditingController: _emailEditingController,
                  label: 'Email',
                  obscureTextBool: false,
                  focus: true,
                  validator: (value) {
                    if (value.isEmpty ||
                        !value.contains('@') ||
                        value.toString().trim().contains(' ') ||
                        !value.toString().trim().contains('.com') ||
                        value.startsWith('@') ||
                        value.endsWith('@') ||
                        value.indexOf('@') != value.lastIndexOf('@') ||
                        value.indexOf('.') == -1 ||
                        value.indexOf('@') > value.lastIndexOf('.') ||
                        value.lastIndexOf('.') > value.length - 3) {
                      print(value.toString().trim().contains(' '));
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                    onPressed: () {
                      
                      if (_formKey.currentState!.validate()) {
                        passwordReset();
                       
                      }
                    },
                    //  focusNode: focusNode,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
                      child: Text(
                        "Log In",
                        style: GoogleFonts.bebasNeue(),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}