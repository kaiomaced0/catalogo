import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/produto_repository.dart';

Container cardProdutoControle(BuildContext context, int produto) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '${ProdutoRepository.produtos[produto].image}',
            alignment: Alignment.center,
          ),
        ],
      ),
    ),
  );
    }
