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

  @override
  String toString() {
    return 'Produto{id: $id, nome: $nome, image: $image, descricao: $descricao, preco: $preco}';
  }
}
