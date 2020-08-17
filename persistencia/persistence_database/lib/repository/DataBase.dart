import '../models/Hospital.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  static final DataBase _singleton = new DataBase._internal();

  factory DataBase() {
    return _singleton;
  }

  static _recuperandoBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "hospitais1.db");
    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE HOSPITAIS (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, endereco VARCHAR, foto VARCHAR, especialidade VARCHAR, numeroleitos INTEGER)";
      db.execute(sql);
    });
    return bd;
  }

  static salvar(Hospital hospital) async {
    Database bd = await _recuperandoBancoDados();

    Map<String, dynamic> dadosHospital = {
      "nome": hospital.nome,
      "endereco": hospital.endereco,
      "foto": hospital.foto,
      "especialidade": hospital.especialidade,
      "numeroleitos": hospital.numeroLeitos
    };

    int id = await bd.insert("HOSPITAIS", dadosHospital);
    print("Salvo:  $id");
  }

  static Future listar() async {
    Database bd = await _recuperandoBancoDados();
    List listaHospitais = await bd.rawQuery("SELECT * FROM HOSPITAIS");

    var _hospitais = new List();
    for (var item in listaHospitais) {
      Hospital hospital = new Hospital(item['nome'], item['endereco'],
          item['especialidade'], item['numeroLeitos']);
      _hospitais.add(hospital);
    }
    return _hospitais;
  }

  DataBase._internal();
}
