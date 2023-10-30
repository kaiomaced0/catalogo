import 'package:catalogo/data/model/item_produto.dart';
import 'package:catalogo/data/model/cliente.dart';

class Pedido {
  late List<ItemProduto> itensProduto;
  late Cliente cliente;
  late double total;
  late DateTime? date;

  Pedido(
      {required this.itensProduto,
      required this.cliente,
      required this.total,
      this.date});

  factory Pedido.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itensProdutoJson = json['itensProduto'];
    final List<ItemProduto> itensProduto = itensProdutoJson
        .map((itemJson) => ItemProduto.fromJson(itemJson))
        .toList();

    return Pedido(
      itensProduto: itensProduto,
      cliente: Cliente.fromJson(json['cliente']),
      total: json['total'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'Pedido{itensProduto: $itensProduto, cliente: $cliente, total: $total}';
  }
}
