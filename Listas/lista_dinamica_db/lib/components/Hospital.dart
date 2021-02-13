class Hospital {
  int id = 0;
  String nome;
  String endereco;
  String foto = 'http://abre.ai/bmg7';
  String especialidade;
  int numeroleitos;

  Hospital(
      this.id, this.nome, this.endereco, this.especialidade, this.numeroleitos);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "nome": nome,
      "endereco": endereco,
      "foto": foto,
      "especialidade": especialidade,
      "numeroleitos": numeroleitos,
    };
  }

  Hospital.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.nome = obj['nome'];
    this.endereco = obj['endereco'];
    this.especialidade = obj['especialidade'];
    this.numeroleitos = obj['numeroleitos'];
  }

  @override
  String toString() {
    return 'Hospital{nome: $nome, endereco: $endereco, especialidade: $especialidade, leitos: $numeroleitos}';
  }
}
