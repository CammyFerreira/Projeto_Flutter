import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/categorias_controller.dart';
import 'package:projeto_flutter/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/views/carrinho.dart';
import 'package:projeto_flutter/views/list_categories.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final CategoriasController _categoriasController = CategoriasController();
  List<Categoria?> _categorias = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    List<Categoria> categoria = await _categoriasController.callAPI();
    setState(() {
      _categorias = categoria;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: _categorias.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListCategories(
                    categoryId: _categorias[index]!.idCategoria,
                    nomeCategoria: _categorias[index]!.nomeCategoria,
                  ),
                ),
              );
            },
            leading: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('images/icon.png'),
                ),
              ),
            ),
            title: Text(_categorias[index]?.nomeCategoria ?? ''),
          );
        },
      ),
    );
  }
}
