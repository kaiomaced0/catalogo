import 'package:catalogo/data/model/cliente.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ClienteRepository {
  static void adicionaLista(Cliente c) {
    clientes.add(c);
    tamanhoListaCliente = clientes.length;
    print('tamanho da lista: ${clientes.length}');
    print('tamanho variaval tamanho: ${tamanhoListaCliente}');
  }

  static int tamanhoListaCliente = 2;

  static int clienteAtual = 0;
  

  static List<Cliente> clientes = [
    Cliente(
      telefone: '63 98444-8853',
      nomeEmpresa: 'Empresa',
      nomeCliente: 'Mario Cesar',
      cnpj: '',
      cpf: '855.490.531-87',
      estado: 'TO',
      cidade: 'Paraiso do Tocantins',
      bairro: 'Jardim Paulista',
      cep: '77600-000',
      rua: '',
      numero: '',
      complemento: ' .............',
    ),
    Cliente(
      telefone: '',
      nomeEmpresa: '',
      nomeCliente: '',
      cnpj: '',
      cpf: '',
      estado: '',
      cidade: '',
      bairro: '',
      cep: '',
      rua: '',
      numero: '',
      complemento: ' .............',
    ),
    // Adicione mais clientes aqui
  ];
}
