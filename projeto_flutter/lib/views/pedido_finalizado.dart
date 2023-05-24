import 'package:flutter/material.dart';

class PedidoFinalizado extends StatelessWidget {
  const PedidoFinalizado({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Bloquear a ação de voltar
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(48),
            child: Column(
              children: [
                const SizedBox(
                  child: Icon(Icons.check_circle_outline_rounded, size:90, color: Colors.greenAccent,),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 48.0,
                    bottom: 32,
                  ),
                  child: Text(
                    "Pedido finalizado com sucesso!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  },
                    child: const Text('Voltar para a home'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
