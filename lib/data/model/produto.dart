import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Produto {
  final int? id;
  final String? nome;
  final String? image;
  final String? descricao;
  late double preco;

  Produto({
    this.id,
    required this.nome,
    required this.image,
    required this.descricao,
    required this.preco,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      image: json['image'],
      descricao: json['descricao'],
      preco: json['preco'].toDouble(),
    );
  }
  static Future<List<Produto>> buscarProdutos() async {
    final prefs = await SharedPreferences.getInstance();
    String p = prefs.getString('produtos') ?? '';

    if (p == '') {
      await prefs.setString('produtos',
          '[{"id":0, "nome":"140.70.17", "image":"assets/images/catalogo1.jpg", "descricao":"", "preco":0.0 },, {"id":1,"nome":"90.90.18 RT CROSS","image":"assets/images/catalogo2.jpg","descricao":"","preco":0.0},{"id":2,"nome":"90.90.18","image":"assets/images/catalogo3.jpg","descricao":"","preco":0.0},{"id":3,"nome":"Catalogo 4","image":"assets/images/catalogo4.jpg","descricao":"","preco":0.0},{"id":4,"nome":"Catalogo 5","image":"assets/images/catalogo5.jpg","descricao":"","preco":0.0},{"id":5,"nome":"Catalogo 6","image":"assets/images/catalogo6.jpg","descricao":"","preco":0.0},{"id":6,"nome":"275.18 ","image":"assets/images/catalogo7.jpg","descricao":"","preco":0.0},{"id":7,"nome":"275.18 KS","image":"assets/images/catalogo8.jpg","descricao":"","preco":0.0},{"id":8,"nome":"60.100.17 - 2.50.17","image":"assets/images/catalogo9.jpg","descricao":"","preco":0.0},{"id":9,"nome":"80.100.14","image":"assets/images/catalogo10.jpg","descricao":"","preco":0.0},{"id":10,"nome":"90.90.19","image":"assets/images/catalogo11.jpg","descricao":"","preco":0.0}, {"id":11,"nome":"110.90.17","image":"assets/images/catalogo12.jpg","descricao":"","preco":0.0}, {"id":12,"nome":"120.80.18","image":"assets/images/catalogo13.jpg","descricao":"","preco":0.0}]');
      p = prefs.getString('produtos')!;
    }
    List<dynamic> jsonList = json.decode(p);
    return jsonList.map((json) => Produto.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'image': image,
      'descricao': descricao,
      'preco': preco,
    };
  }

  static String generateJsonFromProducts(List<Produto> produtos) {
    List<Map<String, dynamic>> produtosMap =
        produtos.map((produto) => produto.toJson()).toList();
    return jsonEncode(produtosMap);
  }

  @override
  String toString() {
    return '{\'id\': $id, \'nome\': $nome, \'image\': $image, \'descricao\': $descricao, \'preco\': $preco}';
  }
}
