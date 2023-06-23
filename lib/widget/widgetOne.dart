import 'package:flutter/material.dart';

import 'buttonSettings.dart';

class widgetOneEdit extends StatefulWidget {
  const widgetOneEdit({super.key});

  @override
  State<widgetOneEdit> createState() => _widgetOneEditState();
}

TextEditingController _textEditingController = TextEditingController();

class _widgetOneEditState extends State<widgetOneEdit> {
  @override
  Widget build(BuildContext context) {
    _textEditingController.text = "Greetings";
    return Scaffold(
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: const Color(0xff46964a),
            borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.save,
            size: 30,
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
                  'Select',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
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
                            color: Color(0xff46964a),
                            size: 32,
                          ),
                        ),
                        const Text(
                          'More',
                          style:
                              TextStyle(color: Color(0xff46964a), fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 5, right: 20),
                    ),
                    const Text(
                      'Type here the menu text:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    const Row(
                      children: [
                        Text(
                          'See Tags',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.info),
                      color: Colors.white,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 16),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        controller: _textEditingController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFB4B4B4)),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        '# Menus',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
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
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        // const Padding(
                        //   padding: EdgeInsets.only(left: 15),
                        //   child: Text(
                        //     textAlign: TextAlign.end,
                        //     '1',
                        //     style: TextStyle(
                        //         fontSize: 18,
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          height: 50,
                          width: 265,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(40)),
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'I m already a customer',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
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
                          icon: const Icon(Icons.edit,
                              color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        // const Padding(
                        //   padding: EdgeInsets.only(left: 15),
                        //   child: Text(
                        //     textAlign: TextAlign.end,
                        //     '2',
                        //     style: TextStyle(
                        //         fontSize: 18,
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          height: 50,
                          width: 265,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(40)),
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'I m not a customer',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
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
                          icon: const Icon(Icons.edit,
                              color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     const Padding(
                //       padding: EdgeInsets.only(left:200, top:140),
                //     ),
                //     Container(
                //       height:60,
                //       width: 60,
                //       decoration: BoxDecoration(
                //           color: const Color(0xff46964a),
                //           borderRadius: BorderRadius.circular(100)),
                //       child: IconButton(
                //         onPressed: () {},
                //         icon: const Icon(
                //           Icons.save,
                //           size: 35,
                //           color: Colors.white,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
