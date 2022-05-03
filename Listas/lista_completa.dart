import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Hospital> _hospitais = [
    new Hospital('Sírio Libanes', 'Avenida Paulista', 'Oncologia'),
    new Hospital('Hospital de Base', 'Rua da flores', 'Ortopedia'),
    new Hospital('Beneficiencia Portuguesa', 'Rua Getulio Vargas','Cardiologia'),
    new Hospital('Hospital Estadual', 'Rua do zoologico', 'Oftalmologia')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospitais de SP',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hospitais com atendimento para o Covid-19 em SP'),
        ),
        body: ListView.builder(
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
            }),
      ),
    );
  }
}

class Endereco extends StatelessWidget {
  final Hospital hospital;
  Endereco({required this.hospital});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Endereço do Hospital"),
        ),
        body: new Container(
          color: Colors.yellowAccent,
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

  Hospital(this.nome, this.endereco, this.especialidade);
}
