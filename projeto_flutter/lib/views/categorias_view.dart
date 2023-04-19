import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/categorias_controller.dart';
import 'package:projeto_flutter/models/category.dart';

class CategoryView extends StatelessWidget {
  final CategoriasController _controller = CategoriasController();
  CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<List<Categoria>>(
          valueListenable: _controller.getCategoriesList(context),
          builder: (_, value, __) => ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _controller.getCategoriesList(context).length,
            itemBuilder: (_, index) {
              final category = _controller.getCategoriesList(context)[index];
              return ListTile(
                title: Text(category.nome),
                onTap: () {
                  // Ação ao clicar na categoria
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
