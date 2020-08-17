import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Hospital> _hospitais = [
    new Hospital('Sírio Libanes', 'Avenida Paulista', 'Oncologia', 10),
    new Hospital('Hospital de Base', 'Rua da flores', 'Ortopedia', 10),
    new Hospital(
        'Beneficiencia Portuguesa', 'Rua Getulio Vargas', 'Cardiologia', 10),
    new Hospital('Hospital Estadual', 'Rua do zoologico', 'Oftalmologia', 10)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospitais de SP',
      home: Scaffold(
        drawer: NavDrawer(_hospitais),
        appBar: AppBar(
          title: Text('Hospitais com atendimento para o Covid-19 em SP'),
        ),
        body: Lista(_hospitais),
      ),
    );
  }
}

class Lista extends StatelessWidget {
  final List<Hospital> _hospitais;
  Lista(this._hospitais);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //Monta a lista automaticamente
        itemCount: _hospitais.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_hospitais[index].foto),
            ),
            title: Text('${_hospitais[index].nome}'),
            subtitle: Text(_hospitais[index].especialidade),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Endereco(hospital: _hospitais[index])),
              );
            },
          );
        });
  }
}

class Endereco extends StatelessWidget {
  final Hospital hospital;
  Endereco({Key key, @required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Endereço do Hospital"),
        ),
        body: new Container(
          color: Colors.white,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Container(
                padding: new EdgeInsets.all(10.0),
                child: Center(
                  child: Image.network(
                    hospital.foto,
                  ),
                ),
              ),
              new Container(
                padding: new EdgeInsets.all(10.0),
                child: Center(
                  child: Text(hospital.nome),
                ),
              ),
              new Container(
                padding: new EdgeInsets.all(10.0),
                child: Center(
                  child: Text(hospital.endereco),
                ),
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

class Cadastro extends StatelessWidget {
  final List<Hospital> _hospitais;
  Cadastro(this._hospitais);

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
                  _hospitais.add(hospitalNovo);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (MyApp()),
                      ));
                },
              )
            ],
          ),
        ));
  }
}

class NavDrawer extends StatelessWidget {
  final List<Hospital> _hospitais;
  NavDrawer(this._hospitais);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Opções',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Cadastro'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cadastro(_hospitais)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Ver no mapa'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
