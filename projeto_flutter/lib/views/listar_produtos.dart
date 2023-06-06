// import 'package:flutter/material.dart';
// import 'package:projeto_flutter/repositories/produto_repository.dart';
// import 'package:intl/intl.dart';
// // ignore: unused_import
// import 'package:projeto_flutter/models/Produtos.dart';
// import 'package:provider/provider.dart';





// class ListarProdutos extends StatefulWidget {
  

//   ListarProdutos({Key? key}): super(key: key);

//   @override
//   State<ListarProdutos> createState() => _ListarProdutosState();
// }

// class _ListarProdutosState extends State<ListarProdutos> {
//   late List<Produto> tabela;
//   late ProdutoRepository produtos;

//   NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

//   Widget build(BuildContext context) {
//     produtos = context.watch<ProdutoRepository>();
//     tabela = produtos.tabela;
  
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Lista de Produtos'), 

//       ),
//       body: ListView.separated(
//         itemBuilder: (BuildContext context, int produto) {
//           return ListTile(
//             leading: SizedBox(
//               // ignore: sort_child_properties_last
//               child:  Image.network(tabela[produto].imageProd),
//               width: 40),
//             title: Text(tabela[produto].nome),
//             trailing: Text(real.format(tabela[produto].preco)),
//           );
//         },
//            // ignore: prefer_const_constructors
//            padding: EdgeInsets.all(16),
//           separatorBuilder: (_ , _____) => Divider( ), 
//           itemCount: tabela.length),
//         ); 
       

  
// }
// }
