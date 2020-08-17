import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'models/Hospital.dart';
import 'repository/DataBase.dart';

void main() {
  runApp(MyAppHome());
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospitais de SP',
      home: _Lista(),
    );
  }
}

class _Lista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista dinâmica'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => Cadastro()));

                setState(() {});
              },
            )
          ],
        ),
        body: Container(
            child: FutureBuilder(
                future: DataBase.listar(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage('${snapshot.data[index].foto}'),
                            ),
                            title: Text('${snapshot.data[index].nome}'),
                            subtitle:
                                Text('${snapshot.data[index].especialidade}'),
                            trailing: Icon(Icons.keyboard_arrow_right));
                      });
                })));
  }
}

class Cadastro extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEndereco = TextEditingController();
  final TextEditingController _controladorEspecialidade =
      TextEditingController();
  final TextEditingController _controladorNumeroLeitos =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Novo Hospital"),
        ),
        body: new Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                controller: _controladorNumeroLeitos,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Quantidade de Leitos'),
              ),
              RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  final String nome = _controladorNome.text;
                  final String endereco = _controladorEndereco.text;
                  final String especialidade = _controladorEspecialidade.text;
                  final int numeroLeitos =
                      int.tryParse(_controladorNumeroLeitos.text);
                  final Hospital hospitalNovo =
                      Hospital(nome, endereco, especialidade, numeroLeitos);
                  print(hospitalNovo);
                  DataBase.salvar(hospitalNovo);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ));
  }
}
