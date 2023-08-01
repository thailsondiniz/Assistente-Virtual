import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wellu_project/widget/buttonSettings.dart';
import 'package:wellu_project/widget/cabecalho.dart';
import 'package:wellu_project/widget/recomendacaoWidget.dart';
import 'package:wellu_project/widget/widgetOne.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> dropdownItems = ['Select'];

  List<dynamic> sessaoList = [];

  String selectedValue = 'Select';

  List<dynamic> recomendacao = [];

  String? selectedFilho;

  List<String> id = [];

  List<String> nome = [];

  var data;

  fetchButtons() async {
    // final apiUrl = Uri.parse('http://10.0.0.149:8000/api/buttons');
    final apiUrl = Uri.parse('http://10.0.0.149:8000/api/buttons');
    final response = await http.get(apiUrl);
    data = json.decode(response.body);
    setState(() {
      for (var element in data) {
        dropdownItems.add(element['nome']);
        id.add(element['id']);
        recomendacao.add(element['nome']);
      }
    });
  }

  void resetDropdown() {
    setState(() {
      selectedValue = 'Select';
      selectedFilho = 'Select';
    });
  }

  @override
  void initState() {
    super.initState();
    fetchButtons();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const Cabecalho(),
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

                                  if (dropdownItems.contains(selectedValue)) {
                                    recomendacao.clear();
                                    for (var element in data) {
                                      if (element['filhos'] != null) {
                                        for (var filhos in element['filhos']) {
                                          if (filhos['id_pai'] ==
                                                  element['id'] &&
                                              selectedValue ==
                                                  element['nome']) {
                                            recomendacao
                                                .add(filhos['nome_filho']);
                                          } else {}
                                        }
                                        sessaoList = recomendacao;
                                      }
                                    }
                                  }
                                  if (selectedValue == 'Select') {
                                    return;
                                  }
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
                      IconButton(
                        onPressed: resetDropdown,
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      IconButton(
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
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            sessaoList.isEmpty ? Container() : sessao(),
            const SizedBox(
              height: 15,
            ),

            //recomendações
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 15, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '# Buttons',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            ...recomendacao.map((e) {
              return recomendacaoWidget(e);
            })
          ],
        ),
      ),
    );
  }

  Widget sessao() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            textAlign: TextAlign.end,
            '2',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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
                    borderRadius: BorderRadius.all(Radius.circular(30)),
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
                value: selectedFilho,
                onChanged: (value) {
                  setState(() {
                    selectedFilho = value.toString();
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xff46964a),
                ),
                isExpanded: true,
                elevation: 16,
                items: sessaoList.map((filho) {
                  return DropdownMenuItem<dynamic>(
                    value: filho,
                    child: Text(
                      filho,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Container(
          child: IconButton(
            onPressed: () {},
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
            icon: const Icon(Icons.edit, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }
}
