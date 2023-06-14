import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/pedido_controller.dart';
import 'package:projeto_flutter/models/pedido.dart';
import 'package:projeto_flutter/components/card_pedidos.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({
    super.key,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final PedidoController _pedidoController = PedidoController();
  List<Pedido> _pedidos = [];

  @override
  void initState() {
    super.initState();
    _fetchPedidos();
  }

  Future<void> _fetchPedidos() async {
    List<Pedido> pedidos = await _pedidoController.fetchPedidos();
    setState(() {
      _pedidos = pedidos;
    });
  }

  Row _logout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.exit_to_app_outlined, color: Colors.red),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: _pedidos.isEmpty
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.sentiment_dissatisfied_outlined,
                size: 90,
              ),
              const Text(
                'Você não possui pedidos',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 300,
              ),
              _logout(),
            ],
          )
          : Column(
              children: [
                ListView.builder(
                  itemCount: _pedidos.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    Pedido pedido = _pedidos[index];
                    if (_pedidos.isEmpty) {
                      return Center(
                        child: Column(
                          children: const [
                            Icon(Icons.sentiment_very_dissatisfied),
                            Text('Você ainda não possui nenhum pedido'),
                          ],
                        ),
                      );
                    }
                    return CardPedidos(pedido: pedido);
                  },
                ),
                const Spacer(),
                _logout(),
              ],
            ),
    );
  }
}
