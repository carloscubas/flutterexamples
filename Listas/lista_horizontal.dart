import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
                Container(
                  width: 200.0,
                  color: Colors.red,
                ),
                Container(
                  width: 200.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 200.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 200.0,
                  color: Colors.brown,
                ),
                Container(
                  width: 200.0,
                  color: Colors.cyanAccent,
                ),
                Container(
                  width: 200.0,
                  color: Colors.purpleAccent,
                )
            ],
          ),
        ),
      ),
    );
  }
}