import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/card_itens.dart';
import 'package:projeto_flutter/models/pedido.dart';

class ItensPedido extends StatefulWidget {
  const ItensPedido({Key? key}) : super(key: key);

  @override
  State<ItensPedido> createState() => _ItensPedidoState();
}

class _ItensPedidoState extends State<ItensPedido> {
  @override
  Widget build(BuildContext context) {
    final Pedido pedido = ModalRoute.of(context)!.settings.arguments as Pedido;
    double total = pedido.calcularTotal();
    String totalFormatado = total.toStringAsFixed(2);
    double totalArredondado = double.parse(totalFormatado);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pedido'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text('Pedido número: #${pedido.pedidoId}', style: const TextStyle(fontSize: 24),),
          ),
          ListView.builder(
            itemCount: pedido.itensPedido.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final ItemPedido itemPedido = pedido.itensPedido[index];
              return CardItens(
                itensPedido: [itemPedido],
              );
            },
          ),
          const Spacer(),
          Container(
            color: Color.fromARGB(134, 4, 240, 201),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Total: R\$$totalArredondado',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
