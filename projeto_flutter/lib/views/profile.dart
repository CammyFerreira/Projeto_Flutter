import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/pedido_controller.dart';
import 'package:projeto_flutter/models/pedido.dart';

class UserProfileScreen extends StatelessWidget {
  // final String? userName;
  // final String? email;
  // final String? address;

  const UserProfileScreen({
    super.key,
    // this.userName,
    // this.email,
    // this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: CardExample(),
    );
  }
}

final PedidoController pedidoController = PedidoController();


class CardExample extends StatelessWidget {
  // const CardExample({super.key});

  // final List names = [
  //   "#83",
  //   "#29",
  //   "#39",
  //   "#12",
  //   "#17",
  //   "#20",
  //   "#32",
  //   "#40",
  //   "#63",
  //   "#75"
  // ];

  // final List jobs = [
  //   "29/05/2023",
  //   "29/05/2023",
  //   "29/05/2023",
  //   "29/05/2023",
  //   "29/05/2023",
  //   "29/05/2023",
  //   "29/05/2023",
  //   "29/05/2023",
  //   "29/05/2023",
  //   "29/05/2023"
  // ];

  CardExample({super.key});

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    body: ListView.builder(
      itemCount: pedidoController.pedidos.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        Pedido pedido = pedidoController.pedidos[index];

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
                          Text('Pedido ID: ${pedido.pedidoId}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('Status: ${pedido.statusId}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Levar para a tela de itens do pedido
                      },
                      child: const Text('Detalhes'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
}