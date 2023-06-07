class Pedido {
  final int pedidoId;
  final String dataPedido;
  final int statusId;
  final List<ItemPedido> itensPedido;

  Pedido({
    required this.pedidoId,
    required this.dataPedido,
    required this.statusId,
    required this.itensPedido,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      pedidoId: json['pedido_id'],
      dataPedido: json['data_pedido'],
      statusId: json['status_id'],
      itensPedido: List<ItemPedido>.from(
        json['itens_pedido'].map(
          (item) => ItemPedido.fromJson(item),
        ),
      ),
    );
  }
}

class ItemPedido {
  final String nomeProduto;
  final int quantidade;
  final String preco;

  ItemPedido(
      {required this.nomeProduto,
      required this.quantidade,
      required this.preco});

  factory ItemPedido.fromJson(Map<String, dynamic> json) {
    return ItemPedido(
      nomeProduto: json['nome_produto'],
      quantidade: json['quantidade'],
      preco: json['preco'],
    );
  }
}
