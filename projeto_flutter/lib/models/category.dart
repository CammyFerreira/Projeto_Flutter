class Categoria {
  int idCategoria;
  String nomeCategoria;
  String descricaoCategoria;

  Categoria({
    required this.idCategoria,
    required this.nomeCategoria,
    required this.descricaoCategoria, 
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      idCategoria: json['id_categoria'],
      nomeCategoria: json['nome_categoria'],
      descricaoCategoria: json['descricao_categoria'],
    );
  }
}
