import 'package:flutter/material.dart';
import 'package:wellu_project/widget/buttonSettings.dart';
import 'package:wellu_project/widget/widgetOne.dart';
import 'package:wellu_project/widget/widgetSupport.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> apiListButtons = [];
  List<String> dropdownItems = ['Select'];
  String selectedValue = 'Select';

  bool isSwitched = false;
  bool isSwitched2 = false;

  void conexaoButtons() async {
    var url = Uri.parse('http://10.0.0.149:8000/api/buttons');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedData = json.decode(response.body);
        setState(() {
          apiListButtons = List.from(decodedData['butoes']);
          for (var item in apiListButtons) {
            dropdownItems.add(item['nome'] as String);
          }
        });
      } else {
        print('Erro na requisição. Código de status: ${response.statusCode}');
      }
    } catch (error) {
      print('Falha na requisição $error');
    }
  }

  @override
  void initState() {
    super.initState();
    conexaoButtons();
  }

  @override
  Widget build(BuildContext context) {
    print(apiListButtons);

    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: const Color(0xff46964a),
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ButtonSettings(),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            color: Color(0xfffffffff),
          ),
        ),
      ),
      backgroundColor: const Color(0xff303030),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff424242),
        elevation: 1,
        title: const Text('Menu Settings'),
      ),
      //INICIO TEMPLATE FOTO
      body: ListView(
        children: [
          Center(
            child: Column(
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
                                isSwitched = !isSwitched;
                              },
                            );
                          },
                          child: const SizedBox(
                            height: 0,
                          ),
                        ),
                        Switch(
                          value: isSwitched,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
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
                                isSwitched2 = !isSwitched2;
                              },
                            );
                          },
                          child: const SizedBox(
                            height: 0,
                          ),
                        ),
                        Switch(
                          value: isSwitched2,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(
                              () {
                                isSwitched2 = value;
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
                Row(
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
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height: 60,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<dynamic>(
                            padding: const EdgeInsets.only(left: 10),
                            dropdownColor: const Color(0xff424242),
                            decoration: const InputDecoration(
                              labelText: 'Select',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xffffffffff),
                                ),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 17,
                                color: Color(0xff46964a),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xff46964a),
                              ),
                            ),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value.toString();
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xff46964a),
                            ),
                            isExpanded: true,
                            elevation: 16,
                            items: dropdownItems.map((item) {
                              return DropdownMenuItem<dynamic>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ), //FIM DO EXPANDED DO PRIMEIRO DROPDOWN
                    // INICIO DO CONTAINER DE EDIÇÃO DO DROPDOWN 1
                    Container(
                      child: IconButton(
                        onPressed: () {
                          setState(
                            () {},
                          );
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const widgetOneEdit(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit,
                            color: Colors.white, size: 30),
                      ),
                    ),
                    //FIM CONTAINER DE EDIÇÃO DO DROPDOWN 1
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}












//////////////////////
//RECOMENDÇÕES GERAL DO TEMPLATE DE RECOMENDAÇÕES
                // Column(
                //   children: [
                //     const Padding(
                //       padding: EdgeInsets.only(right: 20, left: 15, top: 20),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             '# Buttons',
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 15,
                //     ),
                //     Row(
                //       children: [
                //         const Padding(
                //           padding: EdgeInsets.only(left: 15),
                //           child: Text(
                //             textAlign: TextAlign.end,
                //             '1',
                //             style: TextStyle(
                //                 fontSize: 18,
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //         const SizedBox(
                //           width: 15,
                //         ),
                //         Container(
                //           padding: const EdgeInsets.only(left: 15),
                //           height: 50,
                //           width: 255,
                //           decoration: BoxDecoration(
                //               border: Border.all(color: Colors.white),
                //               borderRadius: BorderRadius.circular(40)),
                //           child: Row(
                //             children: [
                //               Image.asset(
                //                 'lib/image/icon.png',
                //                 width: 20,
                //                 height: 20,
                //               ),
                //               const SizedBox(
                //                 width: 10,
                //               ),
                //               // Text(
                //               //   texto1,
                //               //   style: const TextStyle(color: Colors.white),
                //               // ),
                //             ],
                //           ),
                //         ),
                //         IconButton(
                //           onPressed: () {},
                //           icon: const Icon(
                //             Icons.delete_forever,
                //             color: Color(0xffF14D4D),
                //             size: 30,
                //           ),
                //         ),
                //         IconButton(
                //           onPressed: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => const ButtonSettings(),
                //               ),
                //             );
                //           },
                //           icon: const Icon(Icons.edit,
                //               color: Colors.white, size: 30),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // Column(
                //   children: [
                //     const SizedBox(height: 15),
                //     Row(
                //       children: [
                //         const Padding(
                //           padding: EdgeInsets.only(left: 15),
                //           child: Text(
                //             textAlign: TextAlign.end,
                //             '2',
                //             style: TextStyle(
                //                 fontSize: 18,
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //         const SizedBox(
                //           width: 15,
                //         ),
                //         Container(
                //           padding: const EdgeInsets.only(left: 15),
                //           height: 50,
                //           width: 255,
                //           decoration: BoxDecoration(
                //             border: Border.all(color: Colors.white),
                //             borderRadius: BorderRadius.circular(40),
                //           ),
                //           child: Row(
                //             children: [
                //               Image.asset(
                //                 'lib/image/icon.png',
                //                 width: 20,
                //                 height: 20,
                //               ),
                //               const SizedBox(
                //                 width: 10,
                //               ),
                //               // Text(
                //               //   texto2,
                //               //   style: const TextStyle(color: Colors.white),
                //               // ),
                //             ],
                //           ),
                //         ),
                //         IconButton(
                //           onPressed: () {},
                //           icon: const Icon(
                //             Icons.delete_forever,
                //             color: Color(0xffF14D4D),
                //             size: 30,
                //           ),
                //         ),
                //         IconButton(
                //           onPressed: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => const ButtonSettings(),
                //               ),
                //             );
                //           },
                //           icon: const Icon(Icons.edit,
                //               color: Colors.white, size: 30),
                //         ),
                //       ],
                //     ),
                //     const SizedBox(
                //       height: 80,
                //     )
                //   ],
                // ),