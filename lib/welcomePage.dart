import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udaan/constants/modifiedCards.dart';
import 'package:udaan/screens/login.dart';
import 'package:udaan/screens/registration.dart';

class welcomePage extends StatefulWidget {
  static const String id = 'blank_page';
  const welcomePage({Key? key}) : super(key: key);

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      loggedInUser = user;
      print(loggedInUser.email);
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //0xFFFFF7F7
      //0xFFFFF3F3
      backgroundColor: Color(0xFFFFFFFF),
      // appBar: AppBar(
      //   title: Text('Udaan'),
      //   backgroundColor: Color(0xFF830E38),
      // ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.values[3],
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                  child: Image.asset('images/15.png')),
              Text(
                'Udaan',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF830E38),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Giving you wings!',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF830E38),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.0),
              RoundedButton(
                  buttonColor: Color(0xFF830E38),
                  buttonText: 'Register',
                  toDo: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),
              SizedBox(height: 2.0),
              RoundedButton(
                  buttonColor: Color(0xFF830E38),
                  buttonText: 'Login',
                  toDo: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
