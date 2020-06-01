import 'package:authentication/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:authentication/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:authentication/src/bloc/authentication_bloc/authentication_state.dart';
import 'package:authentication/src/bloc/bloc_delegate.dart';
import 'package:authentication/src/repository/user_repository.dart';
import 'package:authentication/src/screen/error_screen.dart';
import 'package:authentication/src/screen/home_screen.dart';
import 'package:authentication/src/screen/loading_screen.dart';
import 'package:authentication/src/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  return runApp(BlocProvider<AuthenticationBloc>(
    create: (context) => AuthenticationBloc(repository: UserRepository()),
    child: AuthenticationApp(),
  ));
}

class AuthenticationApp extends StatefulWidget {
  @override
  _AuthenticationAppState createState() => _AuthenticationAppState();
}

class _AuthenticationAppState extends State<AuthenticationApp> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return LoadingScreen();
          } else if (state is Authenticated) {
            return HomeScreen(user: state.user);
          } else if (state is Unauthenticated) {
            return LoginScreen(repository: UserRepository());
          } else {
            return ErrorScreen(error: "Invalid State!");
          }
        },
      ),
    );
  }
}
