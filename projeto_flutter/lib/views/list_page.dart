import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/product_card.dart';
import 'package:projeto_flutter/controllers/products_controller.dart';
import 'package:projeto_flutter/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/views/pdp.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: GridView.count(
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
          _products.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ProductCard(
                name: _products[index].nome,
                description: _products[index].descricao,
                discount: _products[index].desconto,
                price: _products[index].preco,
                image: _products[index].imagemProduto.isNotEmpty ? _products[index].imagemProduto[0].imagemUrl : '',
                onTap: () async {
                  final response = await http.get(Uri.parse(
                      'http://10.0.2.2:8000/api/produtos?filtro=id_produto:${_products[index].idProduto}'));
                  if (response.statusCode == 200) {
                    final productDetails = json.decode(response.body);
                    final product =
                        Product.fromJson(productDetails['produtos'][0]);
                    Future.delayed(const Duration(microseconds: 0)).then(
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
            );
          },
        ),
      ),
    );
  }
}
