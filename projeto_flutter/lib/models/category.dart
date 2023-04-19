class Categoria {
  int idCategoria;
  String nomeCategoria;
  String? descricaoCategoria;

  Categoria({
    required this.idCategoria,
    required this.nomeCategoria,
    this.descricaoCategoria, 
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      idCategoria: json['idCategoria'],
      nomeCategoria: json['nomeCategoria'],
      descricaoCategoria: json['descricaoCategoria'],
    );
  }
}
