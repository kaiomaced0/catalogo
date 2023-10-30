class ItemProduto {
  late int quantidade;
  late int produto_id;
  late double? preco;

  ItemProduto({
    required this.quantidade,
    required this.produto_id,
    this.preco,
  });

  factory ItemProduto.fromJson(Map<String, dynamic> json) {
    return ItemProduto(
      quantidade: json['quantidade'],
      produto_id: json['produto'],
      preco: json['preco'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'ItemProduto{quantidade: $quantidade, produto_id: $produto_id, preco: $preco}';
  }
}
