import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/cliente_repository.dart';
import 'package:catalogo/data/repository/pedido_repository.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Card cardCliente(BuildContext context, int cliente) {
  print(
      'card cliente \'${ClienteRepository.clientes[cliente].nomeCliente}\' iniciado');
  return Card(
    color: const Color.fromARGB(255, 178, 175, 166),
    child: Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              ClienteRepository.clienteAtual = cliente;
              PedidoRepository.pedidos[PedidoRepository.pedidoAtual].cliente =
                  ClienteRepository.clientes[ClienteRepository.clienteAtual];
              final snackBar = SnackBar(
                backgroundColor: Colors.green,
                content: Text('Cliente atual modificado!'),
                duration:
                    Duration(seconds: 2), // Tempo que o SnackBar fica visível
              );

              // Exibe o SnackBar na parte inferior da tela
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            label: 'Cliente Pedido Atual',
            padding: EdgeInsets.zero,
            icon: Icons.person,
            backgroundColor: const Color.fromARGB(255, 19, 104, 22),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SizedBox(
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Nome: ${ClienteRepository.clientes[cliente].nomeCliente}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Empresa: ${ClienteRepository.clientes[cliente].nomeEmpresa}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Flexible(
                        child: Text(
                          'Cidade: ${ClienteRepository.clientes[cliente].cidade}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
