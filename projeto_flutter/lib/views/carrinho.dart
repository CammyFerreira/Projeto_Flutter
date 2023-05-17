import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/carrinho_card.dart';
import 'package:projeto_flutter/controllers/cart_controller.dart';
import 'package:projeto_flutter/models/cart.dart';
import 'package:projeto_flutter/views/empty_cart.dart';
import 'package:projeto_flutter/views/fragments/endereco.dart';

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  final CartController cartController = CartController();
  late Future<List<CarrinhoItem>> _futureCarrinho;
  double _totalCarrinho = 0.0;

  @override
  void initState() {
    super.initState();
    _futureCarrinho = _listarCarrinho();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _futureCarrinho = _listarCarrinho();
  }

  Future<List<CarrinhoItem>> _listarCarrinho() async {
    try {
      final carrinhoItens = await cartController.listarCarrinho();
      for (var carrinhoItem in carrinhoItens) {
        final produto =
            await cartController.getProductDetails(carrinhoItem.produtoId);
        carrinhoItem.produto = produto;
      }
      _totalCarrinho = calcularTotalCarrinho(carrinhoItens);
      return carrinhoItens;
    } catch (e, s) {
      throw Exception('Falha ao listar carrinho: $e $s');
    }
  }

  double calcularTotalCarrinho(List<CarrinhoItem> carrinho) {
    double total = 0.0;

    for (CarrinhoItem item in carrinho) {
      double precoItem = double.parse(item.produto!.desconto) > 0
          ? double.parse(item.produto!.preco) -
              double.parse(item.produto!.desconto)
          : double.parse(item.produto!.preco);

      total += precoItem;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
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
                    SizedBox(
                      height: 550,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: carrinho.length,
                              itemBuilder: (context, index) {
                                final CarrinhoItem item = carrinho[index];
                                if (item.itemQtd == 0) {
                                  return Container();
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    child: CarrinhoCard(
                                      produto: item.produto!,
                                    ),
                                  );
                                }
                              },
                            ),
                            // const EnderecoCard(),
                          ],
                        ),
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
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 4,
                                ),
                                child: Text('Total'),
                              ),
                              Text(
                                'R\$${_totalCarrinho.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 12),
                              ),
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
              }
            } else if (!snapshot.hasData) {
              // Carrinho vazio
              return const EmptyCart();
            }
            // Tratamento para outros casos
            return const Center(
              child: Text('Falha ao carregar carrinho'),
            );
          },
        ),
      ),
    );
  }
}
