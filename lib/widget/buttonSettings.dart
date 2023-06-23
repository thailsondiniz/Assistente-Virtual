import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:wellu_project/widget/itensProject.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ButtonSettings extends StatefulWidget {
  const ButtonSettings({super.key});

  @override
  State<ButtonSettings> createState() => _ButtonSettingsState();
}

TextEditingController _textEditingController = TextEditingController();
TextEditingController _textEditingController2 = TextEditingController();

class _ButtonSettingsState extends State<ButtonSettings> {
  List<dynamic> apiData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
  var url = Uri.parse('http://10.0.0.149:8000/api/projects');

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      setState(() {
        apiData = List.from(decodedData);
      });
    } else {
      print('Erro na requisição. Código de status: ${response.statusCode}');
    }
  } catch (error) {
    print('Falha na requisição $error');
  }
}

  // final List<String> items = [
  //   'Projeto 1',
  //   'Projeto 2',
  //   'Projeto 3',
  //   'Projeto 4',
  //   'Projeto 5',
  //   'Projeto 6',
  // ];

  Object? selectedValue;
  final TextEditingController textEditingController3 = TextEditingController();

  @override
  void dispose() {
    textEditingController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = "I m already a customer";
    _textEditingController2.text =
        "One of our assistants will assisti you shortly";

    //Lista de projetos
    // const uuid = Uuid();

    // final listProjects = [
    //   Projects(id: uuid.v4(), name: "Projeto 1"),
    //   Projects(id: uuid.v4(), name: "Projeto 2"),
    //   Projects(id: uuid.v4(), name: "Projeto 3"),
    // ];

    // List<Projects?> projectSelection = [];

    // int? selectedOption;
    // String searchText = '';

    // List<int> options = [1, 2, 3];
    // List<int> filteredOptions = [1, 2, 3];
    // void filterOptions() {
    //   filteredOptions = options
    //       .where((option) => 'Projeto $option'
    //           .toLowerCase()
    //           .contains(searchText.toLowerCase()))
    //       .toList();
    // }

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
        title: const Text('Button Settings'),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 14, top: 25),
                  child: Text(
                    'Default Button',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Text(
                    'Send messages with just one click without type manually',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    controller: _textEditingController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 50),
                      labelText: 'Default button',
                      labelStyle: const TextStyle(
                        color: Color(0xff46964a),
                        fontSize: 17,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: Color(0xFFB4B4B4),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: Color(0xFFB4B4B4),
                        ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                    ),
                    const SizedBox(width: 10),
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
                      padding: const EdgeInsets.only(left: 25, right: 22),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        controller: _textEditingController2,
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
                const Padding(
                  padding: EdgeInsets.only(left: 14, top: 25),
                  child: Text(
                    'Select project',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Text(
                    'Point this menu to a project and display its task form to the user.',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 16),
              child: DropdownButton2<Object>(
                isExpanded: true,
                hint: const Text(
                  'Select Project',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                items: apiData
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item['project'],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ))
                    .toList(),
                barrierColor: const Color.fromARGB(108, 26, 26, 26),
                style: const TextStyle(color: Colors.white),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(width: 1, color: Colors.white),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 36, right: 20),
                  height: 45,
                  width: 200,
                ),
                dropdownStyleData: const DropdownStyleData(
                    offset: Offset(30, 185),
                    width: 320,
                    maxHeight: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color(0xff424242),
                    )),
                menuItemStyleData: const MenuItemStyleData(
                  height: 45,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController3,
                  searchInnerWidgetHeight: 40,
                  searchInnerWidget: Container(
                    height: 60,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController3,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Select Project',
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value.toString().contains(searchValue));
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController3.clear();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

