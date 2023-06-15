import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/product_card.dart';
import 'package:projeto_flutter/controllers/products_controller.dart';
import 'package:projeto_flutter/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/views/pdp.dart';

class CarousselProducts extends StatefulWidget {
  const CarousselProducts({super.key});

  @override
  State<CarousselProducts> createState() => _CarousselProductsState();
}

class _CarousselProductsState extends State<CarousselProducts> {
  final ProductController _productController = ProductController();
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    List<Product> products = await _productController.callAPI();
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> firstFiveProducts = _products.take(5).toList();
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.45,
      ),
      items: firstFiveProducts
          .map(
            (item) => ProductCard(
              name: item.nome,
              description: item.descricao,
              discount: item.desconto,
              price: item.preco,
              image: item.imagemProduto[0].imagemUrl,
              onTap: () async {
              final response = await http.get(Uri.parse(
                  'http://10.0.2.2:8000/api/produtos?filtro=id_produto:${item.idProduto}'));
              if (response.statusCode == 200) {
                final productDetails = json.decode(response.body);
                final product = Product.fromJson(productDetails['produtos'][0]);
                Future.delayed(const Duration(microseconds: 1)).then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDPView(product: product)),
                  ),
                );
              } else {
                throw Exception('Failed to load product details');
              }
            },
            ),
          )
          .toList(),
    );
  }
}
