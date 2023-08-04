import 'dart:convert';

import 'package:http/http.dart' as http;

class CreateButton {
  createButton(String name, [dynamic filhos]) async {
    var url = Uri.parse("http://10.0.0.149:8000/api/buttons");

    final Map<String, String> header = {'Content-Type': 'application/json'};

    var corpo = json.encode({
      'nome': name,
      'filhos': filhos,
    });

    var response = await http.post(
      url,
      headers: header,
      body: corpo,
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
