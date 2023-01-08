import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/modifiedCards.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);
  static const String id = 'food_screen';
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7),
      appBar: AppBar(
        title: Text('Udaan'),
        backgroundColor: Color(0xFF830E38),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(35.0, 18.0, 35.0, 18.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.done,
                color: Color(0xFF830E38),
                size: 140.0,
              ),
              Text('Congratulations ! Successfully applied',
                  style: TextStyle(color: Color(0xFF830E38))),
            ],
          ),
        ),
      ),
    );
  }
}
