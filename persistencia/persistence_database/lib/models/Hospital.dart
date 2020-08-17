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
