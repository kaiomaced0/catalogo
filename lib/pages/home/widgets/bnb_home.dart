import 'dart:convert';

import 'package:catalogo/data/model/produto.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:catalogo/pages/cliente/cliente_home.dart';
import 'package:catalogo/pages/home/page_home.dart';
import 'package:catalogo/pages/pedido/pedido.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    onTap: (value) async {
      // final prefs = await SharedPreferences.getInstance();
      // String p = prefs.getString('produtos') ?? '[{"id":0,"nome":"140.70.17","image":"assets/images/catalogo1.jpg","descricao":"","preco":0.0},{"id":1,"nome":"90.90.18 RT CROSS","image":"assets/images/catalogo2.jpg","descricao":"","preco":0.0},{"id":2,"nome":"90.90.18","image":"assets/images/catalogo3.jpg","descricao":"","preco":0.0},{"id":3,"nome":"Catalogo 4","image":"assets/images/catalogo4.jpg","descricao":"","preco":0.0},{"id":4,"nome":"Catalogo 5","image":"assets/images/catalogo5.jpg","descricao":"","preco":0.0},{"id":5,"nome":"Catalogo 6","image":"assets/images/catalogo6.jpg","descricao":"","preco":0.0},{"id":6,"nome":"275.18 ","image":"assets/images/catalogo7.jpg","descricao":"","preco":0.0},{"id":7,"nome":"275.18 KS","image":"assets/images/catalogo8.jpg","descricao":"","preco":0.0},{"id":8,"nome":"60.100.17 - 2.50.17","image":"assets/images/catalogo9.jpg","descricao":"","preco":0.0},{"id":9,"nome":"80.100.14","image":"assets/images/catalogo10.jpg","descricao":"","preco":0.0},{"id":10,"nome":"90.90.19","image":"assets/images/catalogo11.jpg","descricao":"","preco":0.0}, {"id":11,"nome":"110.90.17","image":"assets/images/catalogo12.jpg","descricao":"","preco":0.0}, {"id":10,"nome":"120.80.18","image":"assets/images/catalogo13.jpg","descricao":"","preco":0.0}]';
   
      // List<Produto> ps = await json.decode(p);
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
            MaterialPageRoute(builder: (context) => PageHome(prod: ProdutoRepository.produtos)),
            (Route<dynamic> route) => route.isFirst,
          );
          _currentBnb = 0;
        } else {
          _currentBnb = 0;
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => PageHome(
                      prod: ProdutoRepository.produtos,
                    )),
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
