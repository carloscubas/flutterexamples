import 'package:flutter/material.dart';

void main() {
  runApp(MyAppHome());
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          title: const Text('Lista dinâmica'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.of(context).push(
                     MaterialPageRoute(builder: (context) => Cadastro()));

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
                    backgroundColor: Colors.brown.shade800,
                    child: const Text('AH'),
                  ),
                  title: Text(Hospitais.hospitais[index].nome),
                  subtitle: Text(Hospitais.hospitais[index].especialidade),
                  trailing: const Icon(Icons.keyboard_arrow_right));
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
          title: const Text("Novo Hospital"),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _controladorNome,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _controladorEndereco,
                decoration: const InputDecoration(labelText: 'Endereço'),
              ),
              TextField(
                controller: _controladorEspecialidade,
                decoration: const InputDecoration(labelText: 'Especialidade'),
              ),
              TextField(
                controller: _controladorNumeroLeitos,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantidade de Leitos'),
              ),
              ElevatedButton(
                child: const Text('Cadastrar'),
                onPressed: () {
                  final String nome = _controladorNome.text;
                  final String endereco = _controladorEndereco.text;
                  final String especialidade = _controladorEspecialidade.text;
                  final int? numeroLeitos = int.tryParse(_controladorNumeroLeitos.text);

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
  final String foto = 'https://corona.portal.ap.gov.br/image/agente/elevador.png';
  final String especialidade;
  final int? numeroLeitos;

  Hospital(this.nome, this.endereco, this.especialidade, this.numeroLeitos);

  @override
  String toString() {
    return 'Hospital{nome: $nome, endereco: $endereco, especialidade: $especialidade, leitos: $numeroLeitos}';
  }
}

class Hospitais {
  static final Hospitais _singleton = Hospitais._internal();
  static final List<Hospital> _hospitais = [
    Hospital('Sírio Libanes', 'Avenida Paulista', 'Oncologia', 10),
    Hospital('Beneficiencia Portuguesa', 'Avenida Paulista', 'Pediatria', 10)
  ];

  factory Hospitais() {
    return _singleton;
  }

  static List<Hospital> get hospitais => _hospitais;
  Hospitais._internal();
}
