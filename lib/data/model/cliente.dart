class Cliente {
  final String nomeEmpresa;
  final String nomeCliente;
  final String cnpj;
  final String telefone;
  final String cpf;
  final String estado;
  final String cidade;

  Cliente({
    required this.nomeEmpresa,
    required this.nomeCliente,
    required this.cnpj,
    required this.telefone,
    required this.cpf,
    required this.estado,
    required this.cidade,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      telefone: json['telefone'],
      nomeEmpresa: json['nomeEmpresa'],
      nomeCliente: json['nomeCliente'],
      cnpj: json['cnpj'],
      cpf: json['cpf'],
      estado: json['estado'],
      cidade: json['cidade'],
    );
  }

  @override
  String toString() {
    return 'Cliente{nomeEmpresa: $nomeEmpresa, nomeCliente: $nomeCliente, cnpj: $cnpj, cpf: $cpf, estado: $estado, cidade: $cidade}';
  }
}
