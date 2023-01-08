import 'package:flutter/material.dart';
import '../constants/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants/modifiedCards.dart';
import 'package:udaan/welcomePage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../homePage.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.values[2],
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 100.0,
                      child: Image.asset('images/15.png'),
                    ),
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Please sign in to continue',
                    style: TextStyle(
                      color: Color(0xFF656565),
                      fontSize: 16.0,
                      //fontWeight: FontWeight.
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email'),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                      toDo: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final newUser =
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                          Navigator.pushNamed(context, MyHomePage.id);
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                        // print(email);
                        // print(password);
                      },
                      buttonColor: Color(0xFF830E38),
                      buttonText: 'Log In')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
