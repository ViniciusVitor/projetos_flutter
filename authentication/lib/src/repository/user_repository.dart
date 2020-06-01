import 'package:authentication/src/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Classe responsável pelas ações referentes ao controle de acesso da aplicação.
class UserRepository {
  /// Key utilizada para guardar o token de acesso
  final String key = '"User { email: usuario@email.com, password: password }"';

  /// Verifica se o usuário recebido é igual ao que foi mockado no Main.dart
  Future<void> signIn(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool userNotExists = !prefs.containsKey(user.toString());
    if (userNotExists) {
      throw Exception("Usuário não foi \"Mockado\"");
    }
  }

  Future<bool> verifyIsAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<User> getUserAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = await prefs.get("email");
    final password = await prefs.get("password");
    return User(email: email, password: password);
  }

  Future<void> logout(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(user.toString());
    prefs.remove("email");
    prefs.remove("password");
  }
}
