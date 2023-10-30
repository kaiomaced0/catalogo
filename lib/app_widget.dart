import 'package:catalogo/pages/pedido/pedido_pdf_view.dart';
import 'package:catalogo/pages/pedido/pedidos.dart';
import 'package:catalogo/pages/pedido/widgets/relatorio/pedido_relatorio.dart';
import 'package:flutter/material.dart';
import 'package:catalogo/pages/cliente/cliente_home.dart';
import 'package:catalogo/pages/home/page_home.dart';
import 'package:catalogo/pages/pedido/pedido.dart';
import 'package:catalogo/pages/produtos/produtos.dart';
import 'themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'App Widget',
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        '/': (context) => const PageHome(),
        '/produtos': (context) => const ProdutosHome(),
        '/pedido': (context) => const PedidoPage(),
        '/clientes': (context) => const ClientePage(),
        '/pedidos': (context) => const PedidosPage(),
        '/relatoriopedido': (context) => const PedidoRelatorioPage(),
        '/viewpdf': (context) => const PedidoPdfViewPage()
      },
    );
  }
}
