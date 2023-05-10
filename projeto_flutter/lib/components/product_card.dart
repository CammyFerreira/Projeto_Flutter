import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.name, required this.description, required this.price, required this.discount, this.onTap});

  final String name;
  final String description;
  final String price;
  final String discount;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 150,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getImage(),
                _getName(),
                _getDescription(),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: _getPrice(),
                ),
                _getPriceWithDiscount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

    Text _getName() {
    return Text(
      name,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  SizedBox _getDescription() {
    return SizedBox(
      child: Text(
        description,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  RichText _getPrice() {
    return RichText(
      text: TextSpan(
        text: 'R\$${double.parse(price).toStringAsFixed(2)}',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          decoration: TextDecoration.lineThrough,
        ),
      ),
    );
  }

  Text _getPriceWithDiscount() {
    return Text(
      'R\$${double.parse(discount).toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 12),
    );
  }

  Image _getImage() {
    return Image.asset(
      'images/icon.png',
      height: 90,
      width: 90,
    );
  }
}
