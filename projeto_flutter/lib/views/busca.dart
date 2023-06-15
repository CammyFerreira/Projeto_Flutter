import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projeto_flutter/components/product_card.dart';
import 'package:projeto_flutter/models/product.dart';
import 'package:projeto_flutter/views/pdp.dart';

class Busca extends StatefulWidget {
  const Busca({Key? key}) : super(key: key);

  @override
  State<Busca> createState() => _BuscaState();
}

class _BuscaState extends State<Busca> {
  List<dynamic> produtos = [];
  TextEditingController _searchQueryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchQueryController = TextEditingController();
  }

  @override
  void dispose() {
    _searchQueryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 370,
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
                            _searchProducts(
                                query, _searchQueryController.text, context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: _searchQueryController.text.isNotEmpty,
                child: produtos.isEmpty
                    ? Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Column(
                        children: [
                          Image.asset('images/not_found.png', height: 120, width: 120,),
                          const Padding(
                            padding:  EdgeInsets.only(top: 12),
                            child:  Text('Produto não encontrado'),
                          ),
                        ],
                      ),
                    )
                    : GridView.count(
                        shrinkWrap: true,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: List.generate(
                          produtos.length,
                          (index) {
                            final listaDeProdutos = produtos
                                .map<Product>((json) => Product.fromJson(json))
                                .toList();
                            final Product produto = listaDeProdutos[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: ProductCard(
                                name: produto.nome,
                                description: produto.descricao,
                                discount: produto.desconto,
                                price: produto.preco,
                                image: produto.imagemProduto.isNotEmpty
                                    ? produto.imagemProduto[0].imagemUrl
                                    : 'images/logo.png',
                                onTap: () async {
                                  final response = await http.get(
                                    Uri.parse(
                                        'http://10.0.2.2:8000/api/produtos?filtro=id_produto:${produto.idProduto}'),
                                  );
                                  if (response.statusCode == 200) {
                                    final productDetails =
                                        json.decode(response.body);
                                    final produtos = productDetails['produtos'];
                                    if (produtos.isNotEmpty) {
                                      final product =
                                          Product.fromJson(produtos[0]);
                                      _openMyPage(product);
                                    } else {
                                      throw Exception(
                                          'Failed to load product details');
                                    }
                                  } else {
                                    throw Exception(
                                        'Failed to load product details');
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openMyPage(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => PDPView(
          product: product,
        ),
      ),
    );
  }

  void _searchProducts(String query, String nome, context) async {
    var client = http.Client();
    try {
      final url = Uri.parse('http://10.0.2.2:8000/api/produtos/search/$nome');
      final resposta = await client.get(
        url,
      );
      if (resposta.statusCode == 200) {
        var jsonResponse = jsonDecode(resposta.body);
        List<dynamic> data = jsonResponse['data'];
        setState(() {
          produtos = data;
        });
      } else if (resposta.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, digite o nome do produto')),
        );
      } else {
        print('Falha na solicitação: ${resposta.statusCode}');
      }
    } catch (e) {
      print('Falha na solicitação: $e');
    }
  }
}
