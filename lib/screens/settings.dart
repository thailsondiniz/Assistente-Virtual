// import 'package:flutter/material.dart';

// class Settings extends StatelessWidget {
//   const Settings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: const ListTile(
//           leading: Icon(
//             Icons.android_rounded,
//             size: 70,
//             ),
//           title: Text('Vitual Assistent'),
//           trailing: Icon(Icons.arrow_forward_ios_outlined),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:wellu_project/screens/assistentVirtual.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(
             10,
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(77, 176, 76, 0.15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.android_rounded,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Vitual Assistent',
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(245, 245, 245, 0.1)),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
