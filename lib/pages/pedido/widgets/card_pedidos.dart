import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/pedido_repository.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Card CardPedidos(BuildContext context, int pedido) {
  print('card pedido \'${PedidoRepository.pedidos[pedido]}\' iniciado');
  return Card(
    color: const Color.fromARGB(255, 178, 175, 166),
    child: Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              PedidoRepository.pedidoAtual = pedido;
            },
            label: 'Pedido Atual',
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
                          'Valor Pedido: R\$ ${PedidoRepository.pedidos[pedido].total}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Empresa: ${PedidoRepository.pedidos[pedido].cliente.nomeEmpresa}',
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
                          'Cidade: ${PedidoRepository.pedidos[pedido].cliente.cidade}',
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
