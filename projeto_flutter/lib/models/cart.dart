import 'package:projeto_flutter/models/product.dart';

class CarrinhoItem {
  int? usuarioId;
  int? produtoId;
  int itemQtd;
  Product? produto;

  CarrinhoItem({
    this.usuarioId,
    this.produtoId,
    required this.itemQtd,
    this.produto,
  });

  factory CarrinhoItem.fromJson(Map<String, dynamic> json) {
    return CarrinhoItem(
      usuarioId: json['USUARIO_ID'],
      produtoId: json['PRODUTO_ID'],
      itemQtd: json['ITEM_QTD'],
    );
  }

  static List<CarrinhoItem> listFromJson(List<dynamic> json) {
    return json.map((itemJson) => CarrinhoItem.fromJson(itemJson)).toList();
  }
}