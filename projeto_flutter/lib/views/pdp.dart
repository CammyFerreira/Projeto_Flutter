import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_flutter/controllers/cart_controller.dart';
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
              Navigator.of(context).pushNamed('/carrinho');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getImage(),
          _getTitle(),
          _getDescription(),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              try {
                Fluttertoast.showToast(
                  msg: 'Produto adicionado ao carrinho',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 3,
                  backgroundColor: const Color.fromRGBO(15, 240, 188, 1),
                  textColor: Colors.black87,
                  fontSize: 16.0,
                );
                await CartController().adicionar(product.idProduto);
              } catch (e) {
                throw Exception(e);
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              fixedSize: const Size(200, 50),
            ),
            child: const Text(
              "Adicionar ao carrinho",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Container _getImage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Image.network(
          product.imagemProduto.isEmpty
              ? 'images/logo.png'
              : product.imagemProduto[0].imagemUrl,
          height: 310,
          fit: BoxFit.contain,
          width: double.infinity, errorBuilder: (context, error, stackTrace) {
        return Image.asset('images/logo.png');
      }),
    );
  }

  Padding _getDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 340,
        child: SingleChildScrollView(
          child: Text(
            product.descricao,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }

  Padding _getTitle() {
    final priceWithDiscount =
        double.parse(product.preco) - double.parse(product.desconto);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product.nome,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: RichText(
                  text: product.desconto != '0.00'
                      ? TextSpan(
                          text:
                              'R\$${double.parse(product.preco).toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      : TextSpan(
                          text:
                              'R\$${double.parse(product.preco).toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  product.desconto == '0.00'
                      ? ''
                      : 'R\$${(double.parse(product.preco) - double.parse(product.desconto)).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
