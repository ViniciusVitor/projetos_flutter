import 'package:authentication/src/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

/// Classe responsável pela representação de um evento de login.
@immutable
abstract class LoginEvent extends Equatable {}

/// Classe responsável por representar um evento de login com e-mail e senha.
class SignIn extends LoginEvent {
  final User user;

  SignIn(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() {
    return 'SignIn { $user }';
  }
}
