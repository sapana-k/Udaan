import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:udaan/constants/modifiedCards.dart';
import 'package:udaan/screens/classrooms.dart';
import 'package:udaan/screens/food.dart';
import 'package:udaan/screens/profile.dart';
import 'package:udaan/screens/sport.dart';

import 'constants/jobCard.dart';

class MyHomePage extends StatefulWidget {
  static const String id = 'homePage';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  int salary = 2000;
  String workMode = 'On Site';
  String jobName = 'Farmer';
  String address = 'Sangli';
  String jobDescription = 'This job requires u to know sewing';
  final _firestore = FirebaseFirestore.instance;
  String email = 'r';
  int phone = 3;
  int age = 3;
  String name = 'd';
  int jobno = 0;

  // void getJobData() async {
  //   await for (var snapshot in _firestore.collection('userInfo').snapshots()) {
  //     for (var message in snapshot.docs) {}
  //   }
  // }

  @override
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      loggedInUser = user;
      print(loggedInUser.email);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData() async {
    await for (var snapshot in _firestore.collection('userInfo').snapshots()) {
      for (var message in snapshot.docs) {
        if (message.data()['email'] == loggedInUser.email) {
          email = message.data()['email'];
          phone = message.data()['phone'];
          age = message.data()['age'];
          name = message.data()['name'];
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //0xFFFFF7F7
      //0xFFFFF3F3
      backgroundColor: Color(0xFFFFF7F7),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Udaan',
          ),
        ),
        backgroundColor: Color(0xFF830E38),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF830E38),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            //backgroundColor: Color(0xFF830E38),
            constraints: BoxConstraints(maxHeight: 60.0),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          RawMaterialButton(
              splashColor: Colors.white,
              //backgroundColor: Color(0xFF830E38),
              constraints: BoxConstraints(maxHeight: 60.0),
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  getData();
                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profilePage(
                          email: email,
                          phone: phone,
                          age: age,
                          name: name,
                          jobno: jobno),
                    ));
                //Navigator.pushNamed(context, profilePage.id);
              })
        ]),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              StreamBuilder(
                  stream: _firestore.collection('jobs').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    final alljobs = snapshot.data?.docs;
                    if (alljobs != null) {
                      List<JobCard> jobs = [];
                      for (var j in alljobs) {
                        salary = j['salary'];
                        workMode = j['workMode'];
                        jobName = j['jobName'];
                        address = j['address'];
                        jobDescription = j['jobDescription'];
                        jobs.add(JobCard(
                            jobName: jobName,
                            workMode: workMode,
                            salary: salary,
                            address: address,
                            jobDescription: jobDescription));
                      }
                      return Column(
                        children: jobs,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xFF830E38),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
