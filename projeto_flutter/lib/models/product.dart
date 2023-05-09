class Product {
  int idProduto;
  String nome;
  String descricao;
  String preco;
  String desconto;
  int produtoAtivo;

  Product({
    required this.idProduto,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.desconto,
    required this.produtoAtivo,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      idProduto: json['id_produto'],
      nome: json['nome_produto'],
      descricao: json['descricao_produto'],
      preco: json['preco_produto'],
      desconto: json['desconto_produto'],
      produtoAtivo: json['produto_ativo'],
    );
  }
}