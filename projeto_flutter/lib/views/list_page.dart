import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/products_controller.dart';
import 'package:projeto_flutter/models/product.dart';

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
      body: ListView.builder(
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
            title: Text(_products[index].nome),
            subtitle: Text(_products[index].descricao),
            trailing: Text('R\$ ${_products[index].preco}'),
          );
        },
      ),
    );
  }
}
