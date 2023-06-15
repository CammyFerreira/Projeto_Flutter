class Product {
  int idProduto;
  String nome;
  String descricao;
  String preco;
  String desconto;
  int produtoAtivo;
  List<ImagemProduto> imagemProduto;

  Product({
    required this.idProduto,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.desconto,
    required this.produtoAtivo,
    required this.imagemProduto,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      idProduto: json['id_produto'],
      nome: json['nome_produto'],
      descricao: json['descricao_produto'],
      preco: json['preco_produto'],
      desconto: json['desconto_produto'],
      produtoAtivo: json['produto_ativo'],
      imagemProduto: List<ImagemProduto>.from(
        json['imagem_produto'].map(
          (item) => ImagemProduto.fromJson(item),
        ),
      ),
    );
  }
}

class ImagemProduto {
  int idImagem;
  int imagemOrdem;
  int produtoId;
  String imagemUrl;

  ImagemProduto({
    required this.idImagem,
    required this.imagemOrdem,
    required this.produtoId,
    required this.imagemUrl,
  });

  factory ImagemProduto.fromJson(Map<String, dynamic> json) {
    return ImagemProduto(
      idImagem: json['id_imagem'],
      imagemOrdem: json['imagem_ordem'],
      produtoId: json['produto_id'],
      imagemUrl: json['imagem_url'],
    );
  }
}

