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
  late String? _coinModel = "";
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _coinModel = (await ApiService().getBitCoinPrice())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return const Text("Teste");
  }
}
