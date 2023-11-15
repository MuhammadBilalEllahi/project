import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Auth/Common/my_textfield.dart';
import 'package:project/Auth/Forgot%20Password/forgot_pass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.showRegisterPage});
  final VoidCallback showRegisterPage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _textEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future signin() async {
    print(_textEditingController.text);
    print(_passwordEditingController.text);

    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _textEditingController.text.trim(),
      password: _passwordEditingController.text.trim(),
    );

    print('Sign-in successful for ${userCredential.user!.email}');
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => const HomePage(),
    // ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/login.json',
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2),
                myTextField(
                  textEditingController: _textEditingController,
                  label: 'Username',
                  obscureTextBool: false,
                  focus: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                myTextField(
                  textEditingController: _passwordEditingController,
                  label: 'Passsword',
                  obscureTextBool: true,
                  focus: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, bottom: 10),
                      child: TextButton(
                                onPressed: () {
                    
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const ForgotPasswordPage()));
                                },
                                child: const Text("Forgot Password?")),
                    ),
                  ],
                ),
                // TextField(
                //   focusNode: FocusNode(canRequestFocus: focusNode.canRequestFocus),
                // ),
                ElevatedButton(
                    onPressed: () {
                      print(_textEditingController.text);
                      print(_passwordEditingController.text);
                      if (_formKey.currentState!.validate()) {
                        signin();

                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const HomePage()));

                        // if (_textEditingController.text == 'abc' &&
                        //     _passwordEditingController.text == 'abd') {

                        // }
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("No Account? "),
                      TextButton(
                          onPressed: () {
                            widget.showRegisterPage();
                            print(widget.showRegisterPage.toString());

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const RegisterPage()));
                          },
                          child: const Text("Sign Up Now"))
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
