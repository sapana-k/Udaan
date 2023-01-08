import 'package:udaan/homePage.dart';
import 'package:udaan/screens/food.dart';
import 'package:udaan/screens/classrooms.dart';
import 'package:udaan/screens/login.dart';
import 'package:udaan/screens/registration.dart';
import 'package:udaan/screens/sport.dart';
import 'package:udaan/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:udaan/welcomePage.dart';
import 'package:udaan/screens/registration.dart';
import 'homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: welcomePage(),
      //home: welcomePage(),
      routes: {
        FoodPage.id: (context) => FoodPage(),
        //profilePage.id: (context) => profilePage(),
        SportsPage.id: (context) => SportsPage(),
        ClassroomsPage.id: (context) => ClassroomsPage(),
        LoginScreen.id: (context) => LoginScreen(),
        MyHomePage.id: (context) => MyHomePage(),
        welcomePage.id: (context) => welcomePage(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        //blankPage.id: (context) => blankPage()
      },
    );
  }
}
