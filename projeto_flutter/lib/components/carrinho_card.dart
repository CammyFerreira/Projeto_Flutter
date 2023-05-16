import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/product.dart';

class CarrinhoCard extends StatefulWidget {
  const CarrinhoCard({
    required this.produto,
    super.key,
  });
  final Product produto;

  @override
  State<CarrinhoCard> createState() => _CarrinhoCardState();
}

class _CarrinhoCardState extends State<CarrinhoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Image.asset(
                'images/logo.png',
                height: 80,
                width: 80,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.produto.nome,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text(
                    'Quantidade:',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(right: 6),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        size: 20,
                        Icons.add_circle_outline_rounded,
                      ),
                    ),
                    const Text('1'),
                    IconButton(
                      padding: const EdgeInsets.only(left: 6),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        size: 20,
                        Icons.remove_circle_outline_rounded,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  color: Colors.red,
                  padding: const EdgeInsets.only(bottom: 24),
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: const Icon(
                    size: 20,
                    Icons.delete,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'R\$${double.parse('350').toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
                Text(
                  'R\$${(double.parse(widget.produto.preco) - double.parse(widget.produto.desconto)).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
