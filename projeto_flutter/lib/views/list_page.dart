import 'dart:convert';

import 'package:flutter/material.dart';
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
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/logo.png'),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(_products[index].nome),
            ),
            subtitle: SizedBox(
                height: 60,
                child: Text(
                  _products[index].descricao,
                  overflow: TextOverflow.fade,
                )),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('R\$ ${_products[index].preco}'),
            ),
            onTap: () async {
              final response = await http.get(Uri.parse(
                  'http://10.0.2.2:8000/api/produtos?filtro=id_produto:${_products[index].idProduto}'));
              if (response.statusCode == 200) {
                final productDetails = json.decode(response.body);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => PDPView(product: productDetails)),
                // );
              } else {
                throw Exception('Failed to load product details');
              }
            },
          );
        },
      ),
    );
  }
}
