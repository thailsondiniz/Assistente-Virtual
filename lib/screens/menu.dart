import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

button(buttonName) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
    child: Text(buttonName),
  );
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    bool vitual = true;

    const soucliente = 'Sou Cliente';
    const saberMais = 'Saber Mais';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff424242),
        leading: const Icon(Icons.arrow_back),
        title: const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
          ),
          title: Text(
            'Velocitynet',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xff303030),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.maxFinite,
                color: const Color(0xff424242),
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 5,
                  children: [
                    button(soucliente),
                    button(saberMais),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
