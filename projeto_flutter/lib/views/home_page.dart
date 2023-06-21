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
    List<String> list = [
      'images/carrinhoBanner.png',
      'images/barbieBanner.png',
      'images/pokemonBanner.png'
    ];
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset(
            'images/logo.png',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Busca(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
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
                              color: Color.fromRGBO(255, 94, 61, 1)),
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
                          child: const Text(
                            'Ver todos',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 94, 61, 1)),
                          ),
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
                              color: Color.fromRGBO(118, 50, 213, 1),
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
                            child: const Text(
                              'Ver todas',
                              style: TextStyle(
                                  color: Color.fromRGBO(118, 50, 213, 1)),
                            ),
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
