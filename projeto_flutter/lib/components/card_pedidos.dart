import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/pedido.dart';
import 'package:intl/intl.dart';

class CardPedidos extends StatelessWidget {
  const CardPedidos({super.key, required this.pedido});
  final Pedido pedido;

  @override
  Widget build(BuildContext context) {
    String dataPedidoString = pedido.dataPedido;
    DateTime dataPedido = DateTime.parse(dataPedidoString);
    String dataFormatada = DateFormat('dd/MM/yyyy').format(dataPedido);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Pedido número: ${pedido.pedidoId}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Data: $dataFormatada',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/itens-pedido',
                      arguments: pedido,
                    );
                  },
                  child: const Text('Detalhes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
