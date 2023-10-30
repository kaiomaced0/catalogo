import 'package:catalogo/data/model/pedido.dart';
import 'package:flutter/material.dart';
import 'package:catalogo/data/repository/pedido_repository.dart';
import 'package:catalogo/pages/home/widgets/bnb_home.dart';

class PedidoRelatorioPage extends StatefulWidget {
  static String pathPdf = '';
  const PedidoRelatorioPage({super.key});

  @override
  State<PedidoRelatorioPage> createState() => _PedidoRelatorioPageState();
}

class _PedidoRelatorioPageState extends State<PedidoRelatorioPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  Column _filterResult = Column();
  int quantidade = 0;
  double valorTotal = 0.0;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? _startDate ?? DateTime.now()
          : _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
        _applyDateFilter();
      });
    }
  }

  void _applyDateFilter() {
    if (_startDate != null && _endDate != null) {
      PedidoRepository.pedidos.forEach((element) {
        try {
          if (element.date!.isAfter(_startDate!)) {
            if (element.date!.isBefore(_endDate!)) {
              valorTotal += element.total;
              quantidade += 1;
            }
          }
        } catch (e) {
          print('nulo');
        }
      });
    }
  }

  Pedido pedido = PedidoRepository.pedidos[PedidoRepository.pedidoAtual];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bnbAdm(context, null),
      appBar: AppBar(
        title: const Text('Relatorio Pedidos'),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Escolha as Datas:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context, true);
                  setState(() {});
                },
                child: Text('Selecionar Data Inicial'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context, false);

                  setState(() {});
                },
                child: Text('Selecionar Data Final'),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 4.0,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('Quantidade: $quantidade',
                            style: TextStyle(fontSize: 18)),
                        Text('Valor Total: $valorTotal',
                            style: TextStyle(fontSize: 18))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
