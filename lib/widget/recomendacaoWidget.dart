import 'package:flutter/material.dart';
import 'package:wellu_project/widget/buttonSettings.dart';

Widget recomendacaoWidget(recomedantion) {
  return Builder(builder: (context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              textAlign: TextAlign.end,
              '1',
              style: TextStyle(
                  fontSize: 18,
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
