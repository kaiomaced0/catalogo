import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:catalogo/pages/home/widgets/bs_produto_pedido.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Container cardProduto(BuildContext context, int produto) {
  return Container(
    child: Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              bsProdutoPedido(context, produto);
            },
            label: 'Adicionar',
            padding: EdgeInsets.zero,
            icon: Icons.edit_document,
            backgroundColor: Theme.of(context).hintColor,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '${ProdutoRepository.produtos[produto].image}',
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ],
        ),
      ),
    ),
  );
}
