import 'package:catalogo/data/repository/pedido_repository.dart';
import 'package:catalogo/pages/pedido/widgets/card_pedidos.dart';
import 'package:flutter/material.dart';
import 'package:catalogo/pages/home/widgets/bnb_home.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bnbAdm(context, null),
        appBar: AppBar(
          title: const Text('Pedidos'),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/relatoriopedido'),
                icon: const Icon(Icons.assessment_outlined))
          ],
        ),
        body: Center(
          child: ListView.builder(
              itemCount: PedidoRepository.pedidos.length,
              itemBuilder: (context, int index) => Padding(
                    padding: const EdgeInsets.fromLTRB(1, 10, 10, 1),
                    child: SingleChildScrollView(
                        child: CardPedidos(context, index)),
                  )),
        ));
  }
}
