import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/categorias_home.dart';
import 'package:projeto_flutter/views/categorias_view.dart';
import 'package:projeto_flutter/views/fragments/caroussel_products.dart';
import 'package:projeto_flutter/views/list_page.dart';

final themeMode = ValueNotifier(2);
final TextEditingController _searchQueryController = TextEditingController();

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border.all(
                      color: Colors.deepPurple[200]!,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _searchQueryController,
                          decoration: const InputDecoration(
                            hintText: 'Pesquisar...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          String query = _searchQueryController.text;
                          print('Buscando por: $query');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                ),
                items: list
                    .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/carrinhoBanner.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Produtos',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ListPage(),
                              ),
                            );
                          },
                          child: const Text('Ver todos'),
                        ),
                      ],
                    ),
                    const CarousselProducts(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Categorias',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const CategoryView(),
                                ),
                              );
                            },
                            child: const Text('Ver todas'),
                          ),
                        ],
                      ),
                    ),
                    const CategoriasHome(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
