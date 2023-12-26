import 'package:catalogo/pages/cliente/cliente_home.dart';
import 'package:catalogo/pages/home/page_home.dart';
import 'package:catalogo/pages/pedido/pedido.dart';
import 'package:flutter/material.dart';

int _currentBnb = 0;
BottomNavigationBar bnbAdm(context, int? current) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'Home',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.apps_outlined), label: 'Pedido Atual'),
      BottomNavigationBarItem(icon: Icon(Icons.man_rounded), label: 'clientes')
    ],
    currentIndex: _currentBnb,
    onTap: (value) {
      String? rotaAtual = ModalRoute.of(context)?.settings.name;
      if (rotaAtual == '/relatoriopedido') {
        Navigator.pop(context);
      }
      if (current != null) {
        Navigator.pop(context);
      }
      if (value == 0) {
        if (rotaAtual == '/') {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const PageHome()),
            (Route<dynamic> route) => route.isFirst,
          );
          _currentBnb = 0;
        } else {
          _currentBnb = 0;
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const PageHome()),
            (Route<dynamic> route) => route.isFirst,
          );
        }
      }
      if (value == 1) {
        _currentBnb = 1;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const PedidoPage()),
          (Route<dynamic> route) => route.isFirst,
        );
      }
      if (value == 2) {
        _currentBnb = 2;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ClientePage()),
          (Route<dynamic> route) => route.isFirst,
        );
      }
    },
  );
}
