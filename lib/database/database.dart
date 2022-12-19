import 'package:myquestlog/models/tarefas.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: camel_case_types
class Database_MyQuesLog {
  recuperar_bancode_dados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "bancoDadosTarefas.bd");
    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          " CREATE TABLE tarefas (id INTEGER PRIMARY KEY AUTOINCREMENT, nome_tarefa VARCHAR, xp_tarefa INTEGER, data_time INTEGER)";
      db.execute(sql);
    });
    print("aberto: " + bd.isOpen.toString());
    return bd;
  }

  salvar_dados(String nome_tarefa, int xp_tarefa, DateTime data_time) async {
    Database bd = await recuperar_bancode_dados();
    Map<String, dynamic> dadosUsuario = {
      "nome_tarefa": nome_tarefa,
      "xp_tarefa": xp_tarefa,
      "data_time": data_time.millisecondsSinceEpoch,
    };
    print(dadosUsuario);
    int id = await bd.insert("tarefas", dadosUsuario);

    print("Salvo: $id ");
  }

  Future<List> listar_tarefas() async {
    Database bd = await recuperar_bancode_dados();
    String sql = "SELECT * FROM tarefas";
    List tarefas = await bd.rawQuery(sql);
    for (var tarefas in tarefas) {
      print(
          "id: ${tarefas['id']}nome_tarefa: ${tarefas['nome_tarefa']}xp_tarefa: ${tarefas['xp_tarefa']}data_time: ${tarefas['data_time']}");
    }
    return tarefas;
  }

  listar_uma_tarefa(String nome_tarefa) async {
    Database bd = await recuperar_bancode_dados();
    List tarefas = await bd.query("tarefas",
        columns: ["id", "nome_tarefa", "xp_tarefa", "data_time"],
        where: "nome_tarefa = ?",
        whereArgs: [nome_tarefa]);
    print(tarefas);
  }

  Future<bool> tarefa_existe(String nome_tarefa, int xp_tarefa) async {
    Database bd = await recuperar_bancode_dados();
    List tarefas = await bd.query("tarefas",
        columns: ["id", "nome_tarefa", "xp_tarefa", "data_time"],
        where: "nome_tarefa = ? AND xp_tarefa = ?",
        whereArgs: [nome_tarefa, xp_tarefa]);
    print(tarefas);
    listar_uma_tarefa(nome_tarefa);
    if (tarefas.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  excluir_tarefa(String nome_tarefa) async {
    Database bd = await recuperar_bancode_dados();
    int retorno = await bd.delete(
      "tarefas",
      where: "nome_tarefa = ?",
      whereArgs: [nome_tarefa],
    );
    print("Itens excluidos: " + retorno.toString());
  }

  /*atualizar_tarefa(int id, String nome, String email, String senha) async {
    Database bd = await recuperar_bancode_dados();
    Map<String, dynamic> dadosUsuario = {
      "nome": nome,
      "email": email,
      "senha": senha,
    };
    int retorno = await bd.update(
      "tarefas",
      dadosUsuario,
      where: "id = ?",
      whereArgs: [id],
    );
    print("Itens atualizados: " + retorno.toString());
  }*/

  /*atualizar_tarefa_senha(String email, String senha) async {
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
  }*/
}
