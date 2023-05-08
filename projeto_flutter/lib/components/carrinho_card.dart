import 'package:flutter/material.dart';

class CarrinhoCard extends StatelessWidget {
  const CarrinhoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            child: Image.asset(
              'images/logo.png',
              height: 60,
              width: 60,
            ),
          ),
          Column(
            children: [
              Text('Lego Batman'),
              Text('2'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                    ),
                  ),
                  Text('1'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
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
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                ),
              ),
              Text('R\$200,00'),
            ],
          ),
        ],
      ),
    );
  }
}
