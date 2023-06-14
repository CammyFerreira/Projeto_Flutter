import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/pedido.dart';

class CardItens extends StatelessWidget {
  final List<ItemPedido> itensPedido;

  const CardItens({Key? key, required this.itensPedido}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: itensPedido.map((item) {
          final double itemPreco = double.parse(item.quantidade.toStringAsFixed(2)) *
              double.parse(item.preco);
          return ListTile(
            title: Text(item.nomeProduto),
            subtitle: Text('Quantidade: ${item.quantidade}'),
            trailing: Text('Preço: $itemPreco'),
          );
        }).toList(),
      ),
    );
  }
}