import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_login_screen/models/login_model.dart';
import 'package:flutter_login_screen/repositories/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginModel> login(String email, String password) async {
    final url = FlutterConfig.get('LOGIN_API');
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return LoginModel.fromMap(jsonDecode(response.body));
      } else {
        throw Exception('Erro ao fazer login');
      }
    } on http.ClientException catch (e) {
      print('Erro ao fazer login: $e');
      throw Exception(e);
    }
  }
}
