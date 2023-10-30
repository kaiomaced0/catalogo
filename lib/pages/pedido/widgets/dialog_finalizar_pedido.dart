import 'package:catalogo/data/model/pedido.dart';
import 'package:catalogo/data/repository/cliente_repository.dart';
import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/pedido_repository.dart';

Future<void> showConfirmationDialogFinalizar(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Finalizar?'),
        content: Text('Tem certeza de que deseja Finalizar esse Pedido?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              final snackBar = const SnackBar(
                backgroundColor: Color.fromARGB(255, 243, 108, 99),
                content: Text('Finalizar cancelado!'),
                duration:
                    Duration(seconds: 2), // Tempo que o SnackBar fica visível
              );

              // Exibe o SnackBar na parte inferior da tela
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              Navigator.of(context).pop(); // Fechar o diálogo
            },
          ),
          TextButton(
            child: Text('Confirmar'),
            onPressed: () {
              PedidoRepository.pedidos[PedidoRepository.pedidoAtual].date =
                  DateTime.now();
              PedidoRepository.adicionaPedido(Pedido(
                  itensProduto: [],
                  cliente: ClienteRepository
                      .clientes[ClienteRepository.clienteAtual],
                  total: 0.0,
                  date: DateTime.now()));
              PedidoRepository.pedidoAtual =
                  PedidoRepository.pedidos.length - 1;
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/pedido');
              final snackBar = SnackBar(
                backgroundColor: Colors.green,
                content: Text('Pedido Realizado!'),
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
