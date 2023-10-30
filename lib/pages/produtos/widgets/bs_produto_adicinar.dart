import 'package:flutter/material.dart';
import 'package:catalogo/data/model/produto.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:image_picker/image_picker.dart';

selecionarImagem() async{
  final ImagePicker picker = ImagePicker();

  try{
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if( file != null ) {
      imagemSelecionada = file;
    };

  }
  catch(e) {
    print(e);
  }
}

XFile? imagemSelecionada;
Widget bsProdutoAdicionar(BuildContext context) {
  late String nome = '';
  late double preco = 0.0;
  late String imagem = '';
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Nome Produto', textAlign: TextAlign.start),
            TextField(
              onChanged: (value) {
                nome = value;
              },
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: const InputDecoration(hintMaxLines: 1),
            ),

            const Text('Preço Produto', textAlign: TextAlign.start),
            TextField(
              onChanged: (value) {
                preco = double.parse(value);
              },
              keyboardType: TextInputType.number,
              autofocus: false,
              decoration: const InputDecoration(hintMaxLines: 1),
            ),

            ElevatedButton.icon(
              onPressed: () async {
                  selecionarImagem();
              },
              icon: const Icon(Icons.image),
              label: const Text('Escolher Imagem do Produto'),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SizedBox(
                      width: 120,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: Colors.green.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    15, 5, 15, 5),
                                child: Text('Salvar',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Produto p = Produto(nome: nome, image: 'assets/image/$imagem', descricao: null, preco: preco);
                  print('adicionado produto a lista $p');
                  ProdutoRepository.produtos.add(p);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
