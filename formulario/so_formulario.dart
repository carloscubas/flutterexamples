import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEndereco = TextEditingController();
  final TextEditingController _controladorEspecialidade =
      TextEditingController();
  final TextEditingController _controladorFoto = TextEditingController();
  final TextEditingController _controladorLeitos = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Hospitais'),
        ),
        body: Container(
          padding: new EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controladorNome,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _controladorEndereco,
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              TextField(
                controller: _controladorEspecialidade,
                decoration: InputDecoration(labelText: 'Especialidade'),
              ),
              TextField(
                controller: _controladorFoto,
                decoration: InputDecoration(labelText: 'Foto'),
              ),
              TextField(
                controller: _controladorLeitos,
                decoration: InputDecoration(labelText: 'Número de leitos'),
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                child: Text('Gravar'),
                onPressed: () {
                  final String nome = _controladorNome.text;
                  final String endereco = _controladorEndereco.text;
                  final String especialidade = _controladorEspecialidade.text;
                  final String foto = _controladorFoto.text;
                  final int numeroLeitos =
                      int.tryParse(_controladorLeitos.text);

                  final Hospital hospitalNovo = Hospital(
                      nome, endereco, especialidade, numeroLeitos, foto);
                  print(hospitalNovo);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Hospital {
  final String nome;
  final String endereco;
  final String especialidade;
  final String foto;
  final int leitos;

  Hospital(
      this.nome, this.endereco, this.especialidade, this.leitos, this.foto);

  @override
  String toString() {
    return 'Hospital{nome: $nome, endereço: $endereco, especialidade: $especialidade, leitos: $leitos, foto: $foto}';
  }
}
