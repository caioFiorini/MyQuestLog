import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: camel_case_types
class Database_MyQuesLog {
  recuperar_bancode_dados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "bancoDados.bd");
    var bd = await openDatabase(localBancoDados, version: 2,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          " CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, email VARCHAR PRIMARY KEY, senha VARCHAR)";
      db.execute(sql);
    });
    print("aberto: " + bd.isOpen.toString());
    return bd;
  }

  salvar_dados(String nome, String email, String senha) async {
    Database bd = await recuperar_bancode_dados();
    Map<String, dynamic> dadosUsuario = {
      "nome": nome,
      "email": email,
      "senha": senha,
    };
    print(dadosUsuario);
    int id = await bd.insert("usuarios", dadosUsuario);

    print("Salvo: $id ");
  }

  listar_usuario() async {
    Database bd = await recuperar_bancode_dados();
    String sql = "SELECT * FROM usuarios";
    List usuarios = await bd.rawQuery(sql);
    for (var usuario in usuarios) {
      print("id: " +
          usuario['id'].toString() +
          "nome: " +
          usuario['nome'].toString() +
          "idade: " +
          usuario['email'].toString() +
          "senha: " +
          usuario['senha'].toString());
    }
  }

  listar_um_usuario(int id) async {
    Database bd = await recuperar_bancode_dados();
    List usuarios = await bd.query("usuarios",
        columns: ["id", "nome", "email", "senha"],
        where: "id = ?",
        whereArgs: [id]);
  }

  excluir_usuario(int id) async {
    Database bd = await recuperar_bancode_dados();
    int retorno = await bd.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id],
    );
    print("Itens excluidos: " + retorno.toString());
  }

  atualizar_usuario(int id, String nome, String email, String senha) async {
    Database bd = await recuperar_bancode_dados();
    Map<String, dynamic> dadosUsuario = {
      "nome": nome,
      "email": email,
      "senha": senha,
    };
    int retorno = await bd.update(
      "usuarios",
      dadosUsuario,
      where: "id = ?",
      whereArgs: [id],
    );
    print("Itens atualizados: " + retorno.toString());
  }
}
