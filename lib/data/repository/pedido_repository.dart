import 'package:catalogo/data/model/item_produto.dart';
import 'package:catalogo/data/model/pedido.dart';
import 'package:catalogo/data/repository/cliente_repository.dart';
import 'package:catalogo/data/repository/produto_repository.dart';

class PedidoRepository {
  static void adicionaPedido(Pedido p) {
    pedidos.add(p);
    print('tamanho da lista: ${pedidos.length}');
  }

  static int pedidoAtual = 0;
  static void adicionaLista(int posicao, ItemProduto itemProduto) {
    bool adiciona = true;
    PedidoRepository.pedidos[posicao].itensProduto.forEach((element) {
      if (element.produto_id == itemProduto.produto_id) {
        adiciona = false;
        if (itemProduto.quantidade <= 0) {
          print('entrou if remove');
          removeLista(posicao, element);
        } else {
          print('entrou mudar quantidade');
          element.quantidade = itemProduto.quantidade;
          calculaPrecoLista(posicao);
        }
      }
    });
    if (adiciona) {
      print('entrou final do pedido add');
      PedidoRepository.pedidos[posicao].itensProduto.add(itemProduto);
      calculaPrecoLista(posicao);
    }
  }

  static void esvaziaPedido(int posicao) {
    pedidos[posicao].itensProduto = [];
    calculaPrecoLista(posicao);
  }

  static void calculaPrecoLista(int posicao) {
    double a = 0.0;
    PedidoRepository.pedidos[posicao].itensProduto.forEach((element) {
      print('entrou');
      for (var i = 0; i < ProdutoRepository.produtos.length; i++) {
        if (element.produto_id == i) {
          element.preco =
              ProdutoRepository.produtos[i].preco * element.quantidade;
        }
      }
      a += element.preco!;
    });
    print('valor final de a = $a');
    PedidoRepository.pedidos[posicao].total = a;
  }

  static removeLista(int posicao, ItemProduto itemProduto) {
    print('entrou remove lista');
    PedidoRepository.pedidos[posicao].itensProduto.remove(itemProduto);
    print('removeu');
    calculaPrecoLista(posicao);
    print(PedidoRepository.pedidos[posicao]);
  }

  static List<Pedido> pedidos = [
    Pedido(
        itensProduto: [],
        cliente: ClienteRepository.clientes[0],
        total: 0.0,
        date: DateTime.now()),
  ];
}
