import 'dart:io';

import 'package:flutter/material.dart';
import 'package:catalogo/data/model/produto.dart';
import 'package:catalogo/data/repository/produto_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

Future<String?> saveImage(XFile? file) async {
  if (file == null) return null;

  final directory = await getApplicationDocumentsDirectory();
  final imagePath = '${directory.path}/images';

  final imageDirectory = Directory(imagePath);
  if (!imageDirectory.existsSync()) {
    imageDirectory.createSync(recursive: true);
  }

  final fileName = basename(file.path);
  final localImagePath = '$imagePath/$fileName';
  final savedImage = await File(file.path).copy(localImagePath);

  return savedImage.path;
}

final picker = ImagePicker();
String? imagePath;
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('Preço Produto', textAlign: TextAlign.start),
                  TextField(
                    onChanged: (value) {
                      preco = double.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: const InputDecoration(hintMaxLines: 1),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                XFile? file =
                    await picker.pickImage(source: ImageSource.gallery);
                imagePath = await saveImage(file);
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                  if (imagePath != null) {
                    Produto p = Produto(
                        nome: nome,
                        image: imagePath,
                        descricao: null,
                        preco: 0.0);
                    print('adicionado produto a lista $p');
                    ProdutoRepository.produtos.add(p);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
