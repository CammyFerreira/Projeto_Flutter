import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/categorias_controller.dart';
import 'package:projeto_flutter/models/category.dart';

class CategoriasHome extends StatefulWidget {
  const CategoriasHome({super.key});

  @override
  State<CategoriasHome> createState() => _CategoriasHomeState();
}

class _CategoriasHomeState extends State<CategoriasHome> {
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
    final List<Categoria?> firstEigthCategories = _categorias.take(8).toList();
    return SizedBox(
      height: 200,
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        primary: false,
        crossAxisCount: 4,
        childAspectRatio: 2.0,
        children: List.generate(
          firstEigthCategories.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                onPressed: () {
                  // Lógica do botão
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  _categorias[index]!.nomeCategoria,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
