import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 48.0,
                bottom: 32,
              ),
              child: Text(
                "Seu carrinho está vazio",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(
              child: Image.asset(
                'images/cart.png',
                height: 250,
                width: 250,
              ),
            ),
          ],
        ),
      );
  }
}
