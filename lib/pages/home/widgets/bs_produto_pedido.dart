import 'package:flutter/material.dart';
import 'package:catalogo/data/model/item_produto.dart';
import 'package:catalogo/data/model/produto.dart';
import 'package:catalogo/data/repository/pedido_repository.dart';
import 'package:catalogo/data/repository/produto_repository.dart';

Future bsProdutoPedido(BuildContext context, int id) {
  Produto p = ProdutoRepository.produtos[id];
  late int quantidade = 0;
  late double preco = 0.0;
  TextEditingController tQuant = TextEditingController();
  TextEditingController tPreco = TextEditingController();
  PedidoRepository.pedidos[PedidoRepository.pedidoAtual].itensProduto
      .forEach((element) {
    if (element.produto_id == id) {
      quantidade = element.quantidade;
      preco = element.preco!;
      tQuant.text = quantidade.toString();
      tPreco.text = preco.toString();
    }
  });
  return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.75,
          child: SingleChildScrollView(
              child: SizedBox(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 1.2, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Preço unitário:',
                              textAlign: TextAlign.start),
                          TextField(
                            controller: tPreco,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                preco = double.parse(value);
                                ProdutoRepository.produtos[id].preco = preco;
                              } else {
                                preco = 0.0;
                              }
                            },
                            autofocus: false,
                            decoration: const InputDecoration(hintMaxLines: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                                'Valor Total :  R\$ ${ProdutoRepository.produtos[id].preco * quantidade}',
                                textAlign: TextAlign.start),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Quantidade: '),
                            TextField(
                              controller: tQuant,
                              onChanged: (value) {
                                quantidade = int.parse(value);
                              },
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              decoration:
                                  const InputDecoration(hintMaxLines: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: SizedBox(
                                  width: 120,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    width: double.infinity,
                                    decoration: ShapeDecoration(
                                      color: Colors.green.shade900,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 5, 15, 5),
                                            child: Text('Ok',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              if (quantidade > 0) {
                                ItemProduto i = ItemProduto(
                                    quantidade: quantidade, produto_id: id);
                                PedidoRepository.adicionaLista(
                                    PedidoRepository.pedidoAtual, i);
                                Navigator.of(context).pop();
                              }
                              final snackBar = SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Produto adicionado ao pedido!'),
                                duration: Duration(
                                    seconds:
                                        2), // Tempo que o SnackBar fica visível
                              );

                              // Exibe o SnackBar na parte inferior da tela
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              print(
                                  '${PedidoRepository.pedidos[PedidoRepository.pedidoAtual]}');
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
        );
      });
}
