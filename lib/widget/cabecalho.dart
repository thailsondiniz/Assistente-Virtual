import 'package:flutter/material.dart';

class Cabecalho extends StatefulWidget {
  const Cabecalho({super.key});

  @override
  State<Cabecalho> createState() => _CabecalhoState();
}

class _CabecalhoState extends State<Cabecalho> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0x99535353),
          ),
          child: SizedBox(
            width: 90,
            height: 90,
            child: Image.network(
              'https://storage.googleapis.com/ecdt-logo-saida/aefd69d060e1a63cd12399d373de74e042f9ccaa0cd56d49664c8919ca853e3e/VELOCITYNET-TELECOM.webp',
              //scale:0,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Configure your virtual assistant menus here',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        //FIM DO TEMPLATE FOTO
        // DROPDOWN 1  ESTILIZAÇÃO
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Activated',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        // isSwitched = !isSwitched;
                      },
                    );
                  },
                  child: const SizedBox(),
                ),
                Switch(
                  value: false,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      // isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Just greeting message?',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        // isSwitched2 = !isSwitched2;
                      },
                    );
                  },
                  child: const SizedBox(
                    height: 0,
                  ),
                ),
                Switch(
                  value: false,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(
                      () {
                        // isSwitched2 = value;
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18.0, top: 5, bottom: 20),
              child: Text(
                '# Menus',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0, top: 5),
              child: Text(
                'Actions',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
