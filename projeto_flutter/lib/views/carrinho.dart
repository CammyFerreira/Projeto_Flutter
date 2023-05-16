import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/carrinho_card.dart';
import 'package:projeto_flutter/controllers/cart_controller.dart';
import 'package:projeto_flutter/models/cart.dart';
import 'package:projeto_flutter/views/fragments/endereco.dart';

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  final CartController controller = CartController();
  late Future<List<CarrinhoItem>> _futureCarrinho;

  @override
  void initState() {
    super.initState();
    _futureCarrinho = _listarCarrinho();
  }

  Future<List<CarrinhoItem>> _listarCarrinho() async {
    try {
      final carrinhoItens = await controller.listarCarrinho();
      for (var carrinhoItem in carrinhoItens) {
        final produto =
            await controller.getProductDetails(carrinhoItem.produtoId);
        carrinhoItem.produto = produto;
      }
      return carrinhoItens;
    } catch (e, s) {
      throw Exception('Falha ao listar carrinho: $e $s');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: FutureBuilder<List<CarrinhoItem>>(
            future: _futureCarrinho,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                final List<CarrinhoItem> carrinho = snapshot.data!;
                if (carrinho.isNotEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: carrinho.length,
                              itemBuilder: (context, index) {
                                final CarrinhoItem item = carrinho[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: CarrinhoCard(
                                    produto: item.produto!,
                                  ),
                                );
                              },
                            ),
                            const EnderecoCard(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 4,
                                  ),
                                  child: Text('Total'),
                                ),
                                Text('R\$10,00'),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Fechar Pedido'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text('Carrinho vazio'),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Falha ao carregar carrinho: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: Text('Falha ao carregar carrinho'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
