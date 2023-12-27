import 'dart:convert';

import 'package:catalogo/data/model/produto.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:catalogo/pages/pedido/pdfview/pdfview_page.dart';
import 'package:catalogo/pages/pedido/pedidos.dart';
import 'package:catalogo/pages/pedido/widgets/relatorio/pedido_relatorio.dart';
import 'package:flutter/material.dart';
import 'package:catalogo/pages/cliente/cliente_home.dart';
import 'package:catalogo/pages/home/page_home.dart';
import 'package:catalogo/pages/pedido/pedido.dart';
import 'package:catalogo/pages/produtos/produtos.dart';
import 'themes/themes.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        '/': (context) => const SplashPage(),
        '/home': (context) => const PageHome(prod: []),
        '/produtos': (context) => const ProdutosHome(),
        '/pedido': (context) => const PedidoPage(),
        '/clientes': (context) => const ClientePage(),
        '/pedidos': (context) => const PedidosPage(),
        '/relatoriopedido': (context) => const PedidoRelatorioPage(),
        '/viewpdf': (context) => VisualizarPDF(path: null)
      },
    );
  }
}

Future<Widget>? produtos() async {
  // List<Produto> ps = await Produto.buscarProdutos();
  return PageHome(prod: ProdutoRepository.produtos);
}

class SplashPage extends StatefulWidget {
  const SplashPage({key, this.title}) : super(key: key);
  final title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen(context);
  }
}

Widget _introScreen(BuildContext context) {
  return Stack(
    children: <Widget>[
      FlutterSplashScreen(
        backgroundColor: const Color.fromARGB(255, 205, 170, 170),
        duration: const Duration(seconds: 1),
        nextScreen: FutureBuilder(
            future: produtos(),
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return snapshot.data ?? const SizedBox();
              }
            }),
        splashScreenBody: Center(
          child: Container(
            decoration: const BoxDecoration(color: Colors.blueAccent),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: const Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Text('Pedidos')),
                  ]),
            ),
          ),
        ),
      ),
    ],
  );
}
