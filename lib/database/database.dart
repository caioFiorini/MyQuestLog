import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: camel_case_types
class Database_MyQuesLog {
  recuperar_bancode_dados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "bancoDados.bd");
    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          " CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, email VARCHAR PRIMARY KEY, nome VARCHAR, senha VARCHAR)";
      db.execute(sql);
    });
    print("aberto: " + bd.isOpen.toString());
    return bd;
  }

  salvar_dados(String nome, String email, String senha) async {
    Database bd = await recuperar_bancode_dados();
    Map<String, dynamic> dadosUsuario = {
      "email": email,
      "nome": nome,
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
      print(
          "id: ${usuario['id']}email: ${usuario['email']}nome: ${usuario['nome']}senha: ${usuario['senha']}");
    }
  }

  listar_um_usuario(int id) async {
    Database bd = await recuperar_bancode_dados();
    List usuarios = await bd.query("usuarios",
        columns: ["id", "email", "nome", "senha"],
        where: "id = ?",
        whereArgs: [id]);
  }

  Future<bool> usuario_existe(String email, String senha) async {
    Database bd = await recuperar_bancode_dados();
    String sql = "SELECT * FROM usuarios WHERE email=$email AND senha=$senha";
    List usuario = await bd.rawQuery(sql);

    print(usuario);

    if (usuario.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  excluir_usuario(String email) async {
    Database bd = await recuperar_bancode_dados();
    int retorno = await bd.delete(
      "usuarios",
      where: "email = ?",
      whereArgs: [email],
    );
    print("Itens excluidos: " + retorno.toString());
  }

  atualizar_usuario(int id, String nome, String email, String senha) async {
    Database bd = await recuperar_bancode_dados();
    Map<String, dynamic> dadosUsuario = {
      "email": email,
      "nome": nome,
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

  atualizar_usuario_senha(String email, String senha) async {
    Database bd = await recuperar_bancode_dados();
    Map<String, dynamic> dadosUsuario = {
      "senha": senha,
    };
    int retorno = await bd.update(
      "usuarios",
      dadosUsuario,
      where: "email = ?",
      whereArgs: [email],
    );
    print("Itens atualizados: " + retorno.toString());
  }
}
