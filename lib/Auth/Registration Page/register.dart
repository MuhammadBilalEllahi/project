import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Auth/Common/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.showLoginPage});
  final VoidCallback showLoginPage;


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailEditingController = TextEditingController();
  final _textEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future signup() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailEditingController.text.trim(),
       password: _passwordEditingController.text.trim()
       );
  }
// bool confirmPasswor(){
//   if(_passwordEditingController.text == _confirmPasswordEditingController.text){
//     return true;
//   }
//   return false;
// }


 @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    _passwordEditingController.dispose();
    _emailEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/login.json',
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2),
              myTextField(
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
              myTextField(
                textEditingController: _textEditingController,
                label: 'Username',
                obscureTextBool: false,
                focus: true,
                validator: (value) {
                  if (value.isEmpty ||
                      value.length < 4 ||
                      value.length > 20 ||
                      !RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                    return 'Please enter a valid username (4-20 characters, alphanumeric and underscore only)';
                  }
                  return null;
                },
              ),
              myTextField(
                textEditingController: _passwordEditingController,
                label: 'Passsword',
                obscureTextBool: false,
                focus: false,
                validator: (value) {
                  if (value.isEmpty ||
                      value.length < 6 ||
                      value.toString().trim().contains(' ') ||
                      !RegExp(r'(?=.*[a-z])').hasMatch(value) ||
                      !RegExp(r'(?=.*[A-Z])').hasMatch(value) ||
                      !RegExp(r'(?=.*\d)').hasMatch(value) ||
                      !RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),

              // TextField(
              //   focusNode: FocusNode(canRequestFocus: focusNode.canRequestFocus),
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.validate();

                      if (_validateForm()) {
                        signup();
                      }
                      // _textEditingController.text;
                      // _passwordEditingController.text;
                      // if (_textEditingController.text == 'abc' &&
                      //     _passwordEditingController.text == 'abd') {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => const LoggedIn())
                      //       );
                      // }
                    },
                    //  focusNode: focusNode,
                    child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 12),
                      child: Text("Register"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Already Have An Account? "),
                    TextButton(
                        onPressed: () {
                          widget.showLoginPage();
                          
                          print(widget.showLoginPage.toString());
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const LoginPage()));
                        },
                        child: const Text("Login Now"))
                  ],
                ),
              )
            ]),
      ),
    );
  }

  bool _validateForm() {
    return _emailEditingController.text.isNotEmpty &&
        _textEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty;
  }
}
