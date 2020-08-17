import 'package:flutter/material.dart';

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
        body: ListView.builder(
            itemCount: Hospitais.hospitais.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(Hospitais.hospitais[index].foto),
                  ),
                  title: Text('${Hospitais.hospitais[index].nome}'),
                  subtitle: Text(Hospitais.hospitais[index].especialidade),
                  trailing: Icon(Icons.keyboard_arrow_right));
            }));
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
                  Hospitais.hospitais.add(hospitalNovo);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ));
  }
}

class Hospital {
  final String nome;
  final String endereco;
  final String foto = 'http://abre.ai/bmg7';
  final String especialidade;
  final int numeroLeitos;

  Hospital(this.nome, this.endereco, this.especialidade, this.numeroLeitos);

  @override
  String toString() {
    return 'Hospital{nome: $nome, endereco: $endereco, especialidade: $especialidade, leitos: $numeroLeitos}';
  }
}

// Singleton
class Hospitais {
  static final Hospitais _singleton = new Hospitais._internal();
  static final List<Hospital> _hospitais = [
    new Hospital('Sírio Libanes', 'Avenida Paulista', 'Oncologia', 10),
    new Hospital(
        'Beneficiencia Portuguesa', 'Avenida Paulista', 'Pediatria', 10)
  ];

  factory Hospitais() {
    return _singleton;
  }

  static List<Hospital> get hospitais => _hospitais;
  Hospitais._internal();
}
