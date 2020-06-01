import 'package:authentication/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:authentication/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:authentication/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({@required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState(user: user);
}

class _HomeScreenState extends State<HomeScreen> {
  final User user;

  _HomeScreenState({@required this.user});

  void _logout() {
    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut(user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            tooltip: "Logout",
            icon: Icon(Icons.exit_to_app),
            onPressed: _logout,
          )
        ],
      ),
      body: Center(
        child: Text(
          "${user.email} Logado!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
