import 'package:authentication/src/bloc/login_bloc/login_event.dart';
import 'package:authentication/src/bloc/login_bloc/login_state.dart';
import 'package:authentication/src/model/user.dart';
import 'package:authentication/src/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

/// Classe responsável pelo BLoC de Login.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _repository;

  LoginBloc({@required UserRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  LoginState get initialState => LoginEmpty();

  /// Mapeia eventos em estados
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SignIn) {
      yield* _mapSignInToState(user: event.user);
    }
  }

  /// Mapeia o evento de login com e-mail e senha do usuário.
  Stream<LoginState> _mapSignInToState({User user}) async* {
    if (!(state is LoginLoading)) {
      yield LoginLoading();

      try {
        await _repository.signIn(user);
        yield LoginSuccess();
      } catch (_) {
        String errorMessage;
        errorMessage = "Falha na autenticação.";
        errorMessage += "\nVerifique seu usuário/senha ou sua conexão.";
        yield LoginFailure(error: errorMessage);
      }
    }
  }
}
