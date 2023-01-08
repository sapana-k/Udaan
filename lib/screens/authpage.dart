import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../homePage.dart';
import 'login.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: StreamBuilder<User?>(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return MyHomePage();
        //     } else {
        //       return LoginScreen();
        //     }
        //   },
        // ),
        );
  }
}
