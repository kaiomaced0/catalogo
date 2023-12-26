import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_extend/share_extend.dart';

class VisualizarPDF extends StatefulWidget {
  final String? path;

  VisualizarPDF({required this.path});

  @override
  _VisualizarPDFState createState() => _VisualizarPDFState();
}

class _VisualizarPDFState extends State<VisualizarPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title:
            const Text('Visualizar PDF', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () => ShareExtend.share(
                  widget.path!, "Cartao Pre Natal Digital",
                  sharePanelTitle: "Enviar PDF"),
              icon: const Icon(Icons.ios_share_outlined, color: Colors.white))
        ],
      ),
      body: PDFView(
        filePath: widget.path,
      ),
    );
  }
}
