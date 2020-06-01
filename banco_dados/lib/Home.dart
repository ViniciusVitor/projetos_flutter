import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDeDados() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var db = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente){
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
        db.execute(sql);

      }
    );


    //print("Aberto: "+ db.isOpen.toString());
    return  db;

  }


  _salvar() async{
    Database db = await _recuperarBancoDeDados();

    Map<String, dynamic> dadosUsuario = {
      "nome" : "Joaquim",
      "idade" : 20
    };

    int id = await db.insert("usuarios", dadosUsuario);
    print("Id salvo: $id");

  }

  _recuperarUsuarios() async{

    Database db = await _recuperarBancoDeDados();
    String sql ="select * from usuarios ";
    List usuarios = await db.rawQuery(sql);

    for(var usuario in usuarios){
      print(
        "Id: " + usuario['id'].toString()+
          " Nome: "+usuario['nome']+
          " Idade: "+usuario['idade'].toString()
      );
    }
    //print("Lsita de usuários: "+ usuarios.toString());


}

_recuperarPorId(int id) async{
  Database db = await _recuperarBancoDeDados();

  List usuarios = await db.query(
      "usuarios",
    columns: ["id", "nome", "idade"],
    where: "id = ?",
    whereArgs: [id]

  );
  for(var usuario in usuarios)
  {
    print(
        "Id: " + usuario['id'].toString() +
            " Nome: " + usuario['nome'] +
            " Idade: " + usuario['idade'].toString()
    );
  }


}

_deletar(int id) async{

    Database db = await _recuperarBancoDeDados();
    int retorno = await db.delete(
        "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );

    print("Deletado com sucesso: $retorno");

}

  _atualizar(int id) async{
    Database db = await _recuperarBancoDeDados();

    Map<String, dynamic> dadosUsuario = {
      "nome" : "Maria",
      "idade" : 35
    };

    db.update(
        "usuarios",
        dadosUsuario,
      where: "id = ?",
        whereArgs: [id]
    );

    print("Atualizado com sucesso");

  }

  @override
  Widget build(BuildContext context) {

   // _salvar();
   _recuperarUsuarios();
    //_recuperarPorId(2);
    //_deletar(2);
   //_atualizar(6);
    return Container();
  }
}
