import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> args) async {
  final buttonsMap = await fetchButtons();
  print(buttonsMap);

  // Exemplo de recuperação do JSON de um botão pelo ID
  // if (buttonsMap.containsKey('64a72f26383e8')) {
  //   final button = buttonsMap['64a72f26383e8'];
  //   final buttonJson = {
  //     'id': button!.id,
  //     'nome': button.nome,
  //     'filhos': button.filhos?.map((child) => child.toJson()).toList(),
  //   };
  // } else {
  //   print('Botão não encontrado');
  // }
}

class ButtonModel {
  List<String> nome = [];
  List<String> id = [];
  // final List<ButtonModel>? filhos;

  ButtonModel({
    required this.id,
    required this.nome,
    // this.filhos,
  });

  // factory ButtonModel.fromJson(Map<String, dynamic> json) {
  //   final id = json['id'];
  //   final nome = json['nome'];
  //   final filhosData = json['filhos'] as List<dynamic>?;

  //   List<ButtonModel>? filhos;
  //   if (filhosData != null) {
  //     filhos = filhosData
  //         .map((buttonData) => ButtonModel.fromJson(buttonData))
  //         .toList();
  //   }

  //   return ButtonModel(
  //     id: id,
  //     nome: nome,
  //     filhos: filhos,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'nome': nome,
  //     'filhos': filhos?.map((child) => child.toJson()).toList(),
  //   };
  // }
}

fetchButtons() async {
  List<String> nome = [];
  List<String> id = [];
  ButtonModel buttonModel;

  final apiUrl = Uri.parse('http://10.0.0.149:8000/api/buttons');
  final response = await http.get(apiUrl);
  var data = json.decode(response.body);
  // print(data);

  for (var element in data['butoes']) {
    nome.add(element['nome']);
    id.add(element['id']);

    if (element['filhos'] != null) {
      print(element['nome']);
    }
  }
}

// Future<Map<String, ButtonModel>> fetchButtons() async {
//   final apiUrl = Uri.parse('http://10.0.0.149:8000/api/buttons');
//   final response = await http.get(apiUrl);

//   if (response.statusCode == 200) {
//     final jsonData = json.decode(response.body);
//     if (jsonData != null && jsonData['butoes'] != null) {
//       final buttonDataList = jsonData['butoes'];

//       final buttons = <String, ButtonModel>{};

//       for (final buttonData in buttonDataList) {
//         final id = buttonData['id'];
//         final nome = buttonData['nome'] ?? 'Nome não disponível';
//         final filhosData = buttonData['filhos'] as List<dynamic>?;

//         print(buttonData['nome']);

//         List<ButtonModel>? filhos;
//         if (filhosData != null) {
//           filhos = filhosData
//               .map((buttonData) => ButtonModel.fromJson(buttonData))
//               .toList();
//         }

//         final buttonModel = ButtonModel(id: id, nome: nome, filhos: filhos);
//         buttons[id] = buttonModel;
//       }

//       return buttons;
//     } else {
//       throw Exception('Invalid API response');
//     }
//   } else {
//     throw Exception('Failed to fetch buttons: ${response.statusCode}');
//   }
// }


