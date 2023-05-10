import 'package:flutter/material.dart';
import 'package:projeto_flutter/helpers/helpers.dart';
import 'package:projeto_flutter/models/product.dart';

class PDPView extends StatelessWidget {
  final Product product;

  const PDPView({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(product.nome),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              color: Colors.white,
              Icons.shopping_cart,
            ),
            onPressed: () {
              //TODO navegar para o carrinho
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Helpers.getProductImage(
              '',
              310,
              double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.nome,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "R\$ ${double.parse(product.preco).toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 340,
                  child: SingleChildScrollView(
                    child: Text(
                      product.descricao,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              fixedSize: const Size(200, 50),
            ),
            child: const Text("Adicionar ao carrinho"),
          )
        ],
      ),
    );
  }
}
