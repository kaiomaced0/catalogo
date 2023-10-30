import 'package:flutter/material.dart';
import 'package:catalogo/data/model/cliente.dart';
import 'package:catalogo/data/repository/cliente_repository.dart';

Widget bsClienteAdicionar(BuildContext context) {
  late String nomeEmpresa = '';
  late String nomeCliente = '';
  late String telefone = '';
  late String cnpj = '';
  late String cpf = '';
  late String estado = '';
  late String cidade = '';
  late String bairro = '';
  late String cep = '';
  late String rua = '';
  late String numero = '';
  late String complemento = '';
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Nome Empresa', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) nomeEmpresa = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('Nome Cliente', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) nomeCliente = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('Telefone:', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) telefone = value.toString();
                },
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('CNPJ', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) cnpj = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('CPF cliente', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) cpf = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Endereço',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
            ),
            const Text('Estado', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) estado = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('Cidade', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) cidade = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('Bairro:', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) bairro = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('CEP:', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) cep = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('Rua:', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) rua = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('Numero:', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) numero = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            const Text('Complemento:', textAlign: TextAlign.start),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) {
                  if (value.isNotEmpty) complemento = value;
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: const InputDecoration(hintMaxLines: 1),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                child: Text('Salvar',
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
                onTap: () async {
                  Cliente cliente = Cliente(
                      bairro: bairro,
                      cep: cep,
                      cidade: cidade,
                      cnpj: cnpj,
                      complemento: complemento,
                      cpf: cpf,
                      estado: estado,
                      nomeCliente: nomeCliente,
                      nomeEmpresa: nomeEmpresa,
                      numero: numero,
                      rua: rua,
                      telefone: telefone);
                  await Future(() {
                    ClienteRepository.adicionaLista(cliente);
                  });
                  final snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Cliente adicionado!'),
                    duration: Duration(
                        seconds: 2), // Tempo que o SnackBar fica visível
                  );

                  // Exibe o SnackBar na parte inferior da tela
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  print(
                      'adicionado cliente a lista ${ClienteRepository.clientes}');
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/clientes');
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
