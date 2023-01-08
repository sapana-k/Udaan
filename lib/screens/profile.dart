import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udaan/constants/constant.dart';
import 'package:udaan/screens/registration.dart';
import 'package:udaan/welcomePage.dart';
import '../constants/modifiedCards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profilePage extends StatefulWidget {
  profilePage(
      {Key? Key,
      required this.email,
      required this.phone,
      required this.age,
      required this.name,
      required this.jobno});
  static const String id = 'profilePage';
  String email = 'r';
  int phone = 3;
  int age = 3;
  String name = 'd';
  int jobno = 0;
  final _auth = FirebaseAuth.instance;
  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  late String email = 'sapana@gmail.com';
  late int phone = 284555654;
  late int age = 20;
  late String name = 'Sapana Khedkar';
  late int jobno = 1;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void getData() async {
    await for (var snapshot in _firestore.collection('userInfo').snapshots()) {
      for (var message in snapshot.docs) {
        if (message.data()['email'] == _auth.currentUser.email) {
          email = message.data()['email'];
          phone = message.data()['phone'];
          age = message.data()['age'];
          name = message.data()['name'];
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7),
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Color(0xFF830E38),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(35.0, 18.0, 35.0, 18.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.account_circle_sharp,
                color: Color(0xFF830E38),
                size: 140.0,
              ),
              // Text(
              //   'Profile',
              //   style: TextStyle(
              //       color: Color(0xFF830E38),
              //       fontWeight: FontWeight.w600,
              //       fontSize: 20.0),
              // ),
              Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Name - $name',
                            style: kRegularTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Age -  $age',
                            style: kRegularTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Email - $email',
                            style: kRegularTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Phone - $phone',
                            style: kRegularTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  )),
              // Card(
              //     elevation: 5.0,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20.0)),
              //     child: Padding(
              //       padding: const EdgeInsets.all(18.0),
              //       child: Container(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.stretch,
              //           mainAxisSize: MainAxisSize.min,
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             Text(
              //               'No. of Job Applied - $jobno',
              //               style: kRegularTextStyle,
              //             ),
              //           ],
              //         ),
              //       ),
              //     )),
              Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'No. of Job Applied - $jobno',
                            style: kRegularTextStyle,
                          ),
                        ],
                      ),
                    ),
                  )),
              RoundedButton(
                  buttonColor: Color(0xFF830E38),
                  buttonText: 'Logout',
                  toDo: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, welcomePage.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
