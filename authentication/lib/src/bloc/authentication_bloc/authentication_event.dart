import 'package:authentication/src/model/user.dart';
import 'package:equatable/equatable.dart';

/// Classe responsável por representar os eventos relacionado a autenticação na aplicação.
abstract class AuthenticationEvent extends Equatable {}

/// Classe responsável por representar o evento de inicialização da aplicação.
class AppStarted extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AppStarted';
}

/// Classe responsável por representar o evento de login
/// realizado com sucesso pelo usuário.
class LoggedIn extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoggedIn';
}

/// Classe responsável por representar o evento de logout
/// realizado com sucesso pelo usuário.
class LoggedOut extends AuthenticationEvent {
  final User user;

  LoggedOut(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedOut';
}
