import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/modifiedCards.dart';

class ClassroomsPage extends StatefulWidget {
  const ClassroomsPage({Key? key}) : super(key: key);
  static const String id = 'classroom_screen';
  @override
  State<ClassroomsPage> createState() => _ClassroomsPageState();
}

class _ClassroomsPageState extends State<ClassroomsPage> {
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
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListTile(title: Text('classroom 1')),
              ListTile(title: Text('classroom 2')),
              ListTile(title: Text('classroom 3')),
              ListTile(title: Text('classroom 4')),
            ],
          ),
        ),
      ),
    );
  }
}
