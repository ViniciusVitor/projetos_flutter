import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// Classe responsável pela representação de um evento de login.
@immutable
abstract class LoginState extends Equatable {}

class LoginEmpty extends LoginState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoginEmpty";
}

class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoginSuccess";
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "LoginLoading";
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "LoginFailure";
}
