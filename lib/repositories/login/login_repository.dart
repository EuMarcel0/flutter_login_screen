import 'package:flutter_login_screen/models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel> login(String email, String password);
}
