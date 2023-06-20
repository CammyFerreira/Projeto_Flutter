import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/product_card.dart';
import 'package:projeto_flutter/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/views/pdp.dart';

class ListCategories extends StatefulWidget {
  const ListCategories(
      {super.key, required this.categoryId, this.nomeCategoria});
  final int categoryId;
  final String? nomeCategoria;

  @override
  State<ListCategories> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProductsByCategory();
  }

  Future<void> _fetchProductsByCategory() async {
    final url = Uri.parse(
        'http://10.0.2.2:8000/api/categorias/${widget.categoryId}/produtos');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final productDetails = json.decode(response.body);
      final List<dynamic> productsJson = productDetails['produtos'];
      setState(() {
        _products = productsJson.map((json) => Product.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nomeCategoria ??
            ''), //alterar pra nome da categoria vindo da api
      ),
      body: GridView.count(
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
          _products.length,
          (index) {
            final product = _products[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ProductCard(
                name: product.nome,
                description: product.descricao,
                discount: product.desconto,
                price: product.preco,
                onTap: () async {
                  final response = await http.get(Uri.parse(
                    'http://10.0.2.2:8000/api/produtos?filtro=id_produto:${product.idProduto}',
                  ));
                  if (response.statusCode == 200) {
                    final productDetails = json.decode(response.body);
                    final product =
                        Product.fromJson(productDetails['produtos'][0]);
                    Future.delayed(const Duration(microseconds: 0)).then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDPView(product: product),
                        ),
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
