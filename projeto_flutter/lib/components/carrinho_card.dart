import 'package:flutter/material.dart';

class CarrinhoCard extends StatelessWidget {
  const CarrinhoCard({super.key});

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
                const Text('Lego Batman'),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text('Quantidade'),
                ),
                Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(right: 6),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                      ),
                    ),
                    const Text('1'),
                    IconButton(
                      padding: const EdgeInsets.only(left: 6),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
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
                    Icons.delete,
                  ),
                ),
                const Text('R\$200,00'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
