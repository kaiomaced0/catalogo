import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/pedido_repository.dart';

Future<void> showConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmar exclusão?'),
        content: Text('Tem certeza de que deseja excluir este item?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
              final snackBar = SnackBar(
                backgroundColor: Color.fromARGB(255, 243, 108, 99),
                content: Text('Excluir Realizar!'),
                duration:
                    Duration(seconds: 2), // Tempo que o SnackBar fica visível
              );

              // Exibe o SnackBar na parte inferior da tela
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // Fechar o diálogo
            },
          ),
          TextButton(
            child: Text('Confirmar'),
            onPressed: () {
              PedidoRepository.esvaziaPedido(PedidoRepository.pedidoAtual);
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/pedido');
              final snackBar = SnackBar(
                backgroundColor: const Color.fromARGB(255, 23, 149, 88),
                content: Text('Pedido Exluido!'),
                duration:
                    Duration(seconds: 2), // Tempo que o SnackBar fica visível
              );

              // Exibe o SnackBar na parte inferior da tela
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      );
    },
  );
}
