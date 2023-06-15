import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    this.image,
    this.onTap,
  });

  final String name;
  final String description;
  final String price;
  final String discount;
  final String? image;
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
                Align(alignment: Alignment.center,child: _getImage(),),
                Expanded(child: _getName()),
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

  Padding _getName() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
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
      text: discount != '0.00'
          ? TextSpan(
              text: 'R\$${double.parse(price).toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                decoration: TextDecoration.lineThrough,
              ),
            )
          : TextSpan(
              text: 'R\$${double.parse(price).toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
    );
  }

  Text _getPriceWithDiscount() {
    if (discount.isNotEmpty) {
      return Text(
        discount == '0.00'
            ? ''
            : 'R\$${(double.parse(price) - double.parse(discount)).toStringAsFixed(2)}',
        style: const TextStyle(fontSize: 12),
      );
    }
    return const Text('');
  }

  Image _getImage() {
    return Image.network(
      image ?? '',
      height: 90,
      width: 90,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset('images/logo.png'); 
      },
    );
  }
}
