import 'package:flutter/material.dart';

void main() => runApp(_Lista());

class _Lista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }
}

class MyApp extends  State<_Lista> { 
  
 final List<Planeta> _planetas = [Planeta("Mercurio", "Planeta vermelho"),
                                 Planeta("Venus", "Segundo Planeta"),
                                 Planeta("Terra", "Treceiro Planeta"),
                                 Planeta("Marte", "Planeta Vermelho"),
                                 Planeta("Jupter", "Quarto planeta")];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Planetas'),
        ),
        body: ListView.builder(
          itemCount: _planetas.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text('${_planetas[index].nome}'),
              subtitle: Text('${_planetas[index].descricao}'),
              onTap: () {
                    _planetas.add(_planetas[index]);
                   setState(() {});
                }
            );
          }
        ),
      ),
    );
  }
}

class Planeta {
  String nome = " ";
  String descricao = " ";
  Planeta(this.nome, this.descricao);
}
