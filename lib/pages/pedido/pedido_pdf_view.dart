import 'package:catalogo/data/model/pedido.dart';
import 'package:catalogo/pages/pedido/pedido.dart';
import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/pedido_repository.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_extend/share_extend.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PedidoPdfViewPage extends StatefulWidget {
  const PedidoPdfViewPage({super.key});

  @override
  State<PedidoPdfViewPage> createState() => _PedidoPdfViewPageState();
}

class _PedidoPdfViewPageState extends State<PedidoPdfViewPage> {
  Pedido pedido = PedidoRepository.pedidos[PedidoRepository.pedidoAtual];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Pedido'),
        actions: [
          IconButton(
              onPressed: () => ShareExtend.share(PedidoPage.pathPdf, "file",
                  sharePanelTitle: "Enviar PDF"),
              icon: const Icon(Icons.ios_share_outlined))
        ],
      ),
      body: Center(
          child: PDFView(
        filePath: PedidoPage.pathPdf,
      )),
    );
  }
}
