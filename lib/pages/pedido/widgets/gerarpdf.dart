// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:io';
import 'package:catalogo/data/model/pedido.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:catalogo/pages/pedido/pdfview/pdfview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<void> gerarPdf(Pedido pedido, BuildContext context) async {
  final pdf = pw.Document();
  final ttf = await rootBundle.load("assets/fonts/Roboto-Regular.ttf");
  final font = pw.Font.ttf(ttf);

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a3,
      theme: pw.ThemeData.withFont(
        base: font,
        bold: font,
        italic: font,
        boldItalic: font,
      ),
      build: (context) => [
        pw.Center(
            child: pw.Container(
                child: pw.Padding(
                    padding: const pw.EdgeInsets.all(25),
                    child: pw.Container(
                        child: pw.Column(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.SizedBox(height: 20),
                                pw.Header(
                                  level: 0,
                                  text: 'Consultas',
                                ),
                                pw.SizedBox(height: 20),
                                pw.Column(children: [
                                  pw.Text(
                                      'Nome cliente: ${pedido.cliente.nomeCliente}'),
                                  pw.Text(
                                      'Nome Empresa: ${pedido.cliente.nomeEmpresa}'),
                                  pw.Text('CNPJ: ${pedido.cliente.cnpj}'),
                                  pw.Text(
                                      '${pedido.cliente.cidade} / ${pedido.cliente.estado}'),
                                  pw.Text(
                                      'Telefone para contato: ${pedido.cliente.telefone}'),
                                ]),
                                pw.SizedBox(height: 20),
                                pw.Container(
                                  decoration: const pw.BoxDecoration(),
                                  child: pw.Table.fromTextArray(
                                    context: context,
                                    data: <List<String>>[
                                      <String>[
                                        'Nome',
                                        'Preço',
                                        'Quant',
                                        'Total'
                                      ], // Cabeçalhos
                                      ...pedido.itensProduto.map(
                                        (item) => [
                                          ProdutoRepository
                                              .produtos[item.produto_id].nome
                                              .toString(),
                                          ProdutoRepository
                                              .produtos[item.produto_id].preco
                                              .toString(),
                                          item.quantidade.toString(),
                                          (ProdutoRepository
                                                      .produtos[item.produto_id]
                                                      .preco *
                                                  item.quantidade)
                                              .toString()
                                        ],
                                      )
                                    ],
                                    columnWidths: {
                                      0: const pw.FixedColumnWidth(120.0),
                                      1: const pw.FixedColumnWidth(90.0),
                                      2: const pw.FixedColumnWidth(70.0),
                                      3: const pw.FixedColumnWidth(110.0)
                                    },
                                  ),
                                ),
                              ]),
                          pw.Container(
                              height: 250,
                              child: pw.Padding(
                                padding: const pw.EdgeInsets.fromLTRB(
                                    10, 20, 10, 15),
                                child: pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.end,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.center,
                                  children: [
                                    pw.Padding(
                                        padding: const pw.EdgeInsets.all(20),
                                        child: pw.Text('By Kaio Macedo',
                                            style: pw.TextStyle(
                                                fontStyle: pw.FontStyle.italic,
                                                fontWeight: pw.FontWeight.bold,
                                                fontSize: 10)))
                                  ],
                                ),
                              ))
                        ])))))
      ],
    ),
  );

  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/Pedidos.pdf');
  await file.writeAsBytes(await pdf.save());
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          VisualizarPDF(path: '${directory.path}/Pedidos.pdf'),
    ),
  );
}
