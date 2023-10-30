import 'dart:io';

import 'package:catalogo/data/model/pedido.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:catalogo/pages/pedido/pedido_pdf_view.dart';
import 'package:catalogo/pages/pedido/widgets/card_pedido.dart';
import 'package:catalogo/pages/pedido/widgets/dialog_finalizar_pedido.dart';
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
                            onPressed: () async {
                              _createPdf(context, pedido);
                            },
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                _createPdf(context, pedido);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 37, 29, 109),
                              ),
                              label: const Text('Share'),
                              icon: const Icon(Icons.share),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showConfirmationDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              label: const Text('Excluir'),
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showConfirmationDialogFinalizar(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 29, 124, 32),
                              ),
                              label: const Text('Finalizar'),
                              icon: const Icon(Icons.check),
                            ),
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

  _createPdf(context, Pedido? pedido) async {
    print('iniciou o createPdf');
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);

    pdf.addPage(pdfLib.Page(
        build: (pdfLib.Context context) => pdfLib.Center(
                child: pdfLib.Column(children: [
              pdfLib.Row(children: [
                pdfLib.Text(
                  'Pedido',
                  style: const pdfLib.TextStyle(
                    fontSize: 40,
                  ),
                )
              ]),
              pdfLib.Table(children: [
                pdfLib.TableRow(children: [
                  pdfLib.ListView.builder(
                      itemBuilder: (context, index) {
                        return pdfLib.Expanded(
                            flex: 3,
                            child: pdfLib.SvgImage(
                                svg: ProdutoRepository
                                    .produtos[
                                        pedido!.itensProduto[index].produto_id]
                                    .image!)); //
                      },
                      itemCount: pedido!.itensProduto.length)
                ]),
              ])
            ]))));
    final directory = await getApplicationDocumentsDirectory();
    final String dir = directory.path;
    final String path = '$dir/teste2.pdf';
    final File file = File(path);
    file.writeAsBytesSync(await pdf.save());
    print(
        '-----------_______------_________-------_______------______-------------------');
    print(file.path);
    print(file);
    print('------------------------_-_-_-_____--__________________---');
    PedidoPage.pathPdf = path;
    print('finalizando.');
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PedidoPdfViewPage()));
    print('chamou PedidoPDF');
  }
}
