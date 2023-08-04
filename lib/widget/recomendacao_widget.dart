import 'package:flutter/material.dart';
import 'package:wellu_project/widget/buttonSettings.dart';

Widget recomendacaoWidget(recomedantion) {
  print(recomedantion);

  // List<int> indices = contas.asMap().keys.map((indice) => indice).toList();

  // List<int> teste = [];
  // for (int i = 0; i < contas.length; i++) {
  //   teste.add(i + 1);
  // }

  // Widget meucontador(valor) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 15),
  //     child: Text(
  //       valor.toString(),
  //       textAlign: TextAlign.end,
  //       style: const TextStyle(
  //           fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
  //     ),
  //   );
  // }
  return Builder(builder: (context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '1',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            height: 50,
            width: 255,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                Image.asset(
                  'lib/image/icon.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  recomedantion,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // print(dropdownItems);
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Color(0xffF14D4D),
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ButtonSettings(),
                ),
              );
            },
            icon: const Icon(Icons.edit, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  });
}
