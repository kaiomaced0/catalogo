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
          Navigator.of(context).pushReplacementNamed('/');
          _currentBnb = 0;
        } else {
          _currentBnb = 0;
          Navigator.of(context).pushReplacementNamed('/');
        }
      }
      if (value == 1) {
        _currentBnb = 1;
        Navigator.of(context).pushReplacementNamed('/pedido');
      }
      if (value == 2) {
        _currentBnb = 2;
        Navigator.of(context).pushReplacementNamed('/clientes');
      }
    },
  );
}
