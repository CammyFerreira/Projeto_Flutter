
import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  // final Product? product; 

  Text _getDescription(){
    return Text('Jogo de peças de xadrez');
  }

  Text _getName(){
    return Text('Jogo de xadrez');
  }

  Text _getPrice(){
    return Text('40.00');
  }

  Text _getPriceWithDiscount(){
    return Text('5.00');
  }

  Image _getImage(){
    return Image.asset('images/icon.png');
  }

  Card _getCard(){
    return Card(
      child: Column(
        children: [
          _getImage(),
          _getName(),
          _getDescription(),
          _getPrice(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}