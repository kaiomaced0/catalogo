import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/cliente_repository.dart';
import 'package:catalogo/pages/cliente/widgets/bs_cliente_adicinar.dart';
import 'package:catalogo/pages/cliente/widgets/card_cliente.dart';
import 'package:catalogo/pages/home/widgets/bnb_home.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({super.key});

  @override
  State<ClientePage> createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
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
                        child: bsClienteAdicionar(context)));
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
