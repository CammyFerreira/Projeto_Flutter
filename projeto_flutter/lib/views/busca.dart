import 'package:flutter/material.dart';

final TextEditingController _searchQueryController = TextEditingController();

class Busca extends StatefulWidget {
  const Busca({super.key});

  @override
  State<Busca> createState() => _BuscaState();
}

class _BuscaState extends State<Busca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back),
                Container(
                  width: 340,
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
                          controller: _searchQueryController,
                          onTap: null,
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
              ],
            ),
            Visibility(
              visible: _searchQueryController.text == '', 
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
