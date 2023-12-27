import 'package:catalogo/data/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/cliente_repository.dart';
import 'package:catalogo/pages/cliente/widgets/card_cliente.dart';
import 'package:catalogo/pages/home/widgets/bnb_home.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({super.key});

  @override
  State<ClientePage> createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  TextEditingController nomeEmpresa = TextEditingController();
  TextEditingController login = TextEditingController();
  TextEditingController nomeCliente = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController cnpj = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController estado = TextEditingController();
  TextEditingController cidade = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bnbAdm(context, null),
        appBar: AppBar(
          title: const Text('Cliente'),
          actions: [],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return FractionallySizedBox(
                    heightFactor: 0.9,
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Nome Empresa',
                                  textAlign: TextAlign.start),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: TextField(
                                  onChanged: (value) {},
                                  controller: nomeEmpresa,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  decoration:
                                      const InputDecoration(hintMaxLines: 1),
                                ),
                              ),
                              const Text('Nome Cliente',
                                  textAlign: TextAlign.start),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: TextField(
                                  controller: nomeCliente,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  decoration:
                                      const InputDecoration(hintMaxLines: 1),
                                ),
                              ),
                              const Text('Telefone:',
                                  textAlign: TextAlign.start),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: TextField(
                                  controller: telefone,
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  decoration:
                                      const InputDecoration(hintMaxLines: 1),
                                ),
                              ),
                              const Text('CNPJ', textAlign: TextAlign.start),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: TextField(
                                  controller: cnpj,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  decoration:
                                      const InputDecoration(hintMaxLines: 1),
                                ),
                              ),
                              const Text('CPF cliente',
                                  textAlign: TextAlign.start),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: TextField(
                                  controller: cpf,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  decoration:
                                      const InputDecoration(hintMaxLines: 1),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text('Endereço',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20)),
                              ),
                              const Text('Estado', textAlign: TextAlign.start),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: TextField(
                                  controller: estado,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  decoration:
                                      const InputDecoration(hintMaxLines: 1),
                                ),
                              ),
                              const Text('Cidade', textAlign: TextAlign.start),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: TextField(
                                  controller: cidade,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  decoration:
                                      const InputDecoration(hintMaxLines: 1),
                                ),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 15, 10, 20),
                                    child: Center(
                                      child: SizedBox(
                                        width: 120,
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          width: double.infinity,
                                          decoration: ShapeDecoration(
                                            color: Colors.green.shade900,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      15, 5, 15, 5),
                                                  child: Text('Salvar',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center),
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
                                        cidade: cidade.text,
                                        cnpj: cnpj.text,
                                        cpf: cpf.text,
                                        estado: estado.text,
                                        nomeCliente: nomeCliente.text,
                                        nomeEmpresa: nomeEmpresa.text,
                                        telefone: telefone.text);
                                    await Future(() {
                                      ClienteRepository.adicionaLista(cliente);
                                    });
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text('Cliente adicionado!'),
                                      duration: Duration(
                                          seconds:
                                              2), // Tempo que o SnackBar fica visível
                                    );

                                    // Exibe o SnackBar na parte inferior da tela
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    print(
                                        'adicionado cliente a lista ${ClienteRepository.clientes}');
                                    Navigator.of(context).pop();
                                    Navigator.of(context)
                                        .pushReplacementNamed('/clientes');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )));
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: ClienteRepository.tamanhoListaCliente,
              itemBuilder: (context, int index) => Padding(
                    padding: const EdgeInsets.fromLTRB(1, 10, 10, 1),
                    child: SingleChildScrollView(
                        child: cardCliente(context, index)),
                  )),
        ));
  }
}
