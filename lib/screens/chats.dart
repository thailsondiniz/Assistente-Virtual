import 'package:flutter/material.dart';
import 'package:wellu_project/screens/menu.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          InkWell(
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Velocitynet',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Menu(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
