// Singleton
import 'Hospital.dart';

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
