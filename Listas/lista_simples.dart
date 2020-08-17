import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Benvindo ao segundo bimestre'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.dialpad),
              title: Text('Telefones de emergência'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Telefones de padarias'),
            ),
            ListTile(
              leading: Icon(Icons.art_track),
              title: Text('Telefones de supermercados'),
            ),
          ],
        ),
      ),
    );
  }
}
