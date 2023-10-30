class Cliente {
  final String nomeEmpresa;
  final String nomeCliente;
  final String cnpj;
  final String telefone;
  final String cpf;
  final String estado;
  final String cidade;
  final String bairro;
  final String cep;
  final String rua;
  final String numero;
  final String complemento;

  Cliente({
    required this.nomeEmpresa,
    required this.nomeCliente,
    required this.cnpj,
    required this.telefone,
    required this.cpf,
    required this.estado,
    required this.cidade,
    required this.bairro,
    required this.cep,
    required this.rua,
    required this.numero,
    required this.complemento,
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
      bairro: json['bairro'],
      cep: json['cep'],
      rua: json['rua'],
      numero: json['numero'],
      complemento: json['complemento'],
    );
  }

  @override
  String toString() {
    return 'Cliente{nomeEmpresa: $nomeEmpresa, nomeCliente: $nomeCliente, cnpj: $cnpj, cpf: $cpf, estado: $estado, cidade: $cidade, bairro: $bairro, cep: $cep, rua: $rua, numero: $numero, complemento: $complemento}';
  }
}
