import 'package:authentication/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:authentication/src/model/user.dart';
import 'package:authentication/src/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication_state.dart';

/// Classe responsável pelo BLoC de Autenticação da Aplicação.
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _repository;

  AuthenticationBloc({@required repository})
      : assert(repository != null),
        _repository = repository;

  @override
  AuthenticationState get initialState => Uninitialized();

  /// Mapeia eventos em estados de autenticação.
  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState(user: event.user);
    }
  }

  /// Mapeia o evento de inicialização da aplicação.
  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final bool isUserAuthenticated =
          await _repository.verifyIsAuthenticated();

      final user = User(email: "usuario@email.com", password: "password");
      final preferences = await SharedPreferences.getInstance();

      preferences.setString(user.toString(), user.toString());
      preferences.setString("email", user.email);
      preferences.setString("password", user.password);

      if (isUserAuthenticated) {
        final user = await _repository.getUserAuthenticated();
        yield Authenticated(user: user);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  /// Mapeia o evento de login realizado com sucesso.
  /// Retorna o usuário autenticado.
  Stream<AuthenticationState> _mapLoggedInToState() async* {
    final user = await _repository.getUserAuthenticated();
    yield Authenticated(user: user);
  }

  /// Mapeia o evento de logout realizado pelo usuário.
  Stream<AuthenticationState> _mapLoggedOutToState(
      {@required User user}) async* {
    await _repository.logout(user);
    yield Unauthenticated();
  }
}
