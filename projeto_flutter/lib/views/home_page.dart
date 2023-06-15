import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/categorias_home.dart';
import 'package:projeto_flutter/views/busca.dart';
import 'package:projeto_flutter/views/categorias_view.dart';
import 'package:projeto_flutter/views/fragments/caroussel_products.dart';
import 'package:projeto_flutter/views/list_page.dart';

final themeMode = ValueNotifier(2);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = ['images/carrinhoBanner.png', 'images/barbieBanner.png', 'images/pokemonBanner.png'];
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
                    children: [
                      Expanded(
                        child: TextField(
                          enabled: true,
                          readOnly: true,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const Busca(),
                            ),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Pesquisar...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const IconButton(
                        icon: Icon(Icons.search),
                        onPressed: null
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
                              item,
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
