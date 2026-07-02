import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hortiflutter/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = "http://localhost:3000/usuarios";

  //REGISTER:
  static Future<bool> register(UserModel user) async {
    final response = await http.post(
      Uri.parse("baseUrl/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201){
      return true; //validação em teste com endereço 201
    }else{
      //ignore: avoid_print
      print("Erro: ${response.body}");
      return false; //Caso teste com endereço 201 esteja inválido
    }
  }

  static Future<UserModel?> login(String login, String senha) async{
    final response = await http.post(
      Uri.parse("baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"Login": login, "Senha": senha}),
    );
    
    if (response.statusCode == 200){
      return UserModel.fromJson(jsonDecode(response.body));
    }else{
      //ignore: avoid_print
      print("Erro: ${response.body}");
      return null;
    }
  }
}