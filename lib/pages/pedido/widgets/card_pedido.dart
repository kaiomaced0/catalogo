import 'package:catalogo/data/repository/pedido_repository.dart';
import 'package:flutter/material.dart';
import 'package:catalogo/data/model/pedido.dart';
import 'package:catalogo/data/repository/produto_repository.dart';

Card cardPedido(BuildContext context, Pedido pedido) {
  return Card(
    elevation: 3,
    margin: const EdgeInsets.all(10),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Pedido',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 28, 20, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cliente: ${pedido.cliente.nomeCliente}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Empresa: ${pedido.cliente.nomeEmpresa}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'CPF: ${pedido.cliente.cpf}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'CNPJ: ${pedido.cliente.cnpj}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Endereço: ${pedido.cliente.rua}, ${pedido.cliente.numero}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Cidade: ${pedido.cliente.cidade}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Estado: ${pedido.cliente.estado}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'CEP: ${pedido.cliente.cep}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Itens do Pedido',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ListView(shrinkWrap: true, children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(
                              ProdutoRepository
                                  .produtos[
                                      pedido.itensProduto[index].produto_id]
                                  .image!,
                              height: MediaQuery.of(context).size.width * 0.35,
                              width: MediaQuery.of(context).size.width * 0.35),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '     ${ProdutoRepository.produtos[pedido.itensProduto[index].produto_id].nome}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '     ${pedido.itensProduto[index].quantidade} x  R\$ ${ProdutoRepository.produtos[pedido.itensProduto[index].produto_id].preco} = R\$ ${pedido.itensProduto[index].preco}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              itemCount: pedido.itensProduto.length,
            ),
          ]),
          const SizedBox(height: 10),
          Text(
            'Total: R\$ ${pedido.total}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
