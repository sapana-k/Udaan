import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/modifiedCards.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);
  static const String id = 'sports_screen';
  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7),
      appBar: AppBar(
        title: Text('Campus AR Navigation'),
        backgroundColor: Color(0xFF800000),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(35.0, 18.0, 35.0, 18.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // ListTile(
              //   title: Text('Play Ground'),
              //   leading: FlatButton(
              //     child: Icon(Icons.add_alarm),
              //     onPressed: () {
              //       Navigator.pushNamed(context, ArObjectPage.id);
              //     },
              //     color: Colors.red,
              //   ),
              // ),
              ListTile(title: Text('Badminton Court')),
              ListTile(title: Text('GymKhana')),
              ListTile(title: Text('Basketball Court')),
            ],
          ),
        ),
      ),
    );
  }
}
