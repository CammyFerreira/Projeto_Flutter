import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/carrinho_card.dart';
import 'package:projeto_flutter/controllers/categorias_controller.dart';
import 'package:projeto_flutter/models/category.dart';

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical:4 ),
            child: CarrinhoCard(),
          ),
           const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical:4 ),
            child: CarrinhoCard(),
          ),
           const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical:4 ),
            child: CarrinhoCard(),
          ),
          const Spacer(),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 4,),
                      child: Text('Total'),
                    ),
                    Text('R\$10,00'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Fechar Pedido'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
