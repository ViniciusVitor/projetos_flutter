import 'package:authentication/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:authentication/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:authentication/src/bloc/login_bloc/login_bloc.dart';
import 'package:authentication/src/bloc/login_bloc/login_event.dart';
import 'package:authentication/src/bloc/login_bloc/login_state.dart';
import 'package:authentication/src/component/rounded_button.dart';
import 'package:authentication/src/component/text_input.dart';
import 'package:authentication/src/model/user.dart';
import 'package:authentication/src/repository/user_repository.dart';
import 'package:authentication/src/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _repository;

  LoginScreen({@required UserRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(repository: _repository),
      child: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signIn() {
    final user = User(
      email: _emailController.text,
      password: _passwordController.text,
    );

    BlocProvider.of<LoginBloc>(context).add(SignIn(user));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
        if (state is LoginFailure) {
          showMessage(key: _scaffoldKey, message: state.error);
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextInput(
                    controller: _emailController,
                    labelText: "E-mail",
                  ),
                  TextInput(
                    controller: _passwordController,
                    labelText: "Password",
                    obscureText: true,
                  ),
                  RoundedButton(
                    text: "Sign In",
                    onPressed: _signIn,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
