import 'package:flutter/material.dart';
import 'api_service.dart';
import 'model.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controladorValor = TextEditingController();
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  late List<BitcoinPriceModel>? _coinModel = [];

  void _getData() async {
    _coinModel = (await ApiService().getBitCoinPrice())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  String displayCotacao(BitcoinPriceModel model, String valorReal) {
    double value = 0.0;
    if (valorReal.isNotEmpty) {
      value = model.value * double.parse(valorReal);
    }
    return '$value - ${model.description}';
  }

  @override
  Widget build(BuildContext context) {
    final realValueField = TextField(
      controller: _controladorValor,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Valor em real",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final buton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getData();
        },
        child: Text("Cotação",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotação de BitCoins'),
      ),
      body: Column(children: [
        const SizedBox(height: 10.0),
        realValueField,
        const SizedBox(height: 10.0),
        buton,
        const SizedBox(height: 10.0),
        Expanded(
            child: _coinModel!.isNotEmpty && _controladorValor.text.isNotEmpty
                ? ListView.builder(
                    itemCount: _coinModel!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Text(displayCotacao(
                            _coinModel![index], _controladorValor.text)),
                      );
                    })
                : const Text("Sem cotação no momento")),
      ]),
    );
  }
}
