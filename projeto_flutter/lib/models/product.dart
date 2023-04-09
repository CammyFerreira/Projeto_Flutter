class Product {
  int id;
  String nome;
  String descricao;
  String preco;
  String desconto;
  int produtoAtivo;

  Product({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.desconto,
    required this.produtoAtivo,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      preco: json['preco'],
      desconto: json['desconto'],
      produtoAtivo: json['produto_ativo'],
    );
  }
}