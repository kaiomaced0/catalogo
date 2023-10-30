import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:catalogo/pages/home/widgets/bnb_home.dart';
import 'package:catalogo/pages/home/widgets/card_produto.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bnbAdm(context, null),
        appBar: AppBar(
          title: const Text('Produtos'),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                if (value == 'opcao1') {
                  print('Opção 1 selecionada');
                } else if (value == 'opcao2') {
                  print('Opção 2 selecionada');
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'opcao1',
                    child: Text('configs'),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/produtos');
                    },
                  ),
                ];
              },
            )
          ],
        ),
        body: Center(
          child: ListView.builder(
              itemCount: ProdutoRepository.produtos.length,
              itemBuilder: (context, int index) => Padding(
                    padding: const EdgeInsets.fromLTRB(1, 10, 10, 1),
                    child: cardProduto(context, index),
                  )),
        ));
  }
}
