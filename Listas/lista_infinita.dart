import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
 final List<String> _planetas = ["Mercúrio", "Vênus", "Terra", "Marte", "Jupter", "Saturno", "Urâno", "Netuno", "Plutão", "Lua"];
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: ListView.builder(
          itemCount: _planetas.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text('${_planetas[index]}'),
            );
          }
        ),
      ),
    );
  }
}