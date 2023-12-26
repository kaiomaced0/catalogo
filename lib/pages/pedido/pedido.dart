import 'dart:io';

import 'package:catalogo/data/model/pedido.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:catalogo/pages/pedido/pdfview/pdfview_page.dart';
import 'package:catalogo/pages/pedido/widgets/card_pedido.dart';
import 'package:catalogo/pages/pedido/widgets/dialog_finalizar_pedido.dart';
import 'package:catalogo/pages/pedido/widgets/gerarpdf.dart';
import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/pedido_repository.dart';
import 'package:catalogo/pages/home/widgets/bnb_home.dart';
import 'package:catalogo/pages/pedido/widgets/dialog_excluir_pedido.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class PedidoPage extends StatefulWidget {
  static String pathPdf = "";
  const PedidoPage({super.key});

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  final GlobalKey _cardKey = GlobalKey();
  Pedido pedido = PedidoRepository.pedidos[PedidoRepository.pedidoAtual];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bnbAdm(context, null),
        appBar: AppBar(
          title: const Text('Pedido'),
          actions: [],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton.icon(
                            onPressed: () async {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 37, 29, 109),
                            ),
                            label: const Text('Lista de pedidos'),
                            icon: const Icon(Icons.list_alt),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: GestureDetector(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.width * 0.11,
                                decoration: ShapeDecoration(
                                  color: const Color.fromARGB(255, 37, 29, 109),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
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
                                    Icon(Icons.share),
                                    Text(
                                      '  Share',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () async {
                              gerarPdf(pedido, context);
                              print('ok');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: GestureDetector(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.width * 0.11,
                                decoration: ShapeDecoration(
                                  color: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
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
                                    Icon(Icons.delete),
                                    Text(
                                      '  Excluir',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () => showConfirmationDialog(context),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: GestureDetector(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.width * 0.11,
                                decoration: ShapeDecoration(
                                  color: const Color.fromARGB(255, 29, 124, 32),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
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
                                    Icon(Icons.check),
                                    Text(
                                      '  Finalizar',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () =>
                                showConfirmationDialogFinalizar(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                cardPedido(context, pedido)
              ],
            ),
          ),
        ));
  }
}
