import 'package:authentication/src/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Classe responsável por representar os estados relacionado a autenticação na aplicação.
abstract class AuthenticationState extends Equatable {}

/// Classe responsável por representar o estado de autenticação
/// não inicializada na aplicação.
class Uninitialized extends AuthenticationState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Uninitialized';
}

/// Classe responsável por representar o estado de
/// autenticação efetuada na aplicação.
class Authenticated extends AuthenticationState {
  final User user;

  Authenticated({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { $user }';
}

/// Classe responsável por representar o estado de autenticação
/// não realizada na aplicação.
class Unauthenticated extends AuthenticationState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Unauthenticated';
}
