import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:catalogo/pages/home/widgets/bnb_home.dart';
import 'package:catalogo/pages/produtos/widgets/bs_produto_adicinar.dart';

class ProdutosHome extends StatefulWidget {
  const ProdutosHome({super.key});

  @override
  State<ProdutosHome> createState() => _ProdutosHomeState();
}

class _ProdutosHomeState extends State<ProdutosHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bnbAdm(context, null),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return FractionallySizedBox(
                    heightFactor: 0.9,
                    child: SingleChildScrollView(
                        child: bsProdutoAdicionar(context)));
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Produtos Controle'),
          actions: [],
        ),
        body: ListView.builder(
            itemCount: ProdutoRepository.produtos.length,
            itemBuilder: (context, int index) =>
                Text(ProdutoRepository.produtos[index].nome.toString())));
  }
}
