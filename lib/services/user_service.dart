import 'dart:convert';

import 'package:hortiflutter/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = "http://localhost:3000/usuarios";

  static Future<bool> register(UserModel user) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print("Erro: ${response.body}");
      return false;
    }
  }

  static Future<UserModel?> login(String login, String senha) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"login": login, "senha": senha}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      print("Erro: ${response.body}");
      return null;
    }
  }
}
