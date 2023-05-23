import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/views/fragments/caroussel_products.dart';
import 'package:projeto_flutter/views/list_page.dart';

final themeMode = ValueNotifier(2);
final TextEditingController _searchQueryController = TextEditingController();

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
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
                      color: Colors.grey[200],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
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
                options: CarouselOptions(),
                items: list
                    .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(item.toString()),
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
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  primary: false,
                  crossAxisCount: 4,
                  childAspectRatio: 2.0,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Lógica do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Teste'),
                    ),
                   ElevatedButton(
                      onPressed: () {
                        // Lógica do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Teste'),
                    ),
                   ElevatedButton(
                      onPressed: () {
                        // Lógica do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Teste'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Teste'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Teste'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Teste'),
                    ),
                   ElevatedButton(
                      onPressed: () {
                        // Lógica do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Teste'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Teste'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
