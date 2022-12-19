import 'package:myquestlog/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:myquestlog/user/usuario.dart';

class dbSupabase {
  // Supabase Database Functions
  createUser(String email, String password, String name) async {
    try {
      // Cria usuário no Supabase
      final AuthResponse authRes = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      // Cria informaçoes do usuário no Supabase
      // Atributos, Nível e XP são automaticamente 0 (zero)
      final data = await supabase
          .from('users')
          .upsert({'name': name, 'user_id': authRes.user!.id, 'email': email});
      // Atualiza classe global do id usuario Supabase
      userSupabaseId = authRes.user!.id;
      //debugPrint('\n\nUser ID: $userSupabaseId\n\n'); // Apenas para teste
    } on AuthException {
      deletedAccountLogin(email);
    } catch (error){
      debugPrint('Erro ao fazer cadastro -> $error');
    }
  }

  // Como o supabase não permite deletar o usuário auth, mudamos o atributo "deletado" para true
  // Portanto, se ele quiser recuperar a conta, deve se registrar novamente, e nessa hora, o atributo
  // "deletado ficará como false"
  deletedAccountLogin(String email) async{
    try {
      Map<String, dynamic> userInfo = await supabase
          .from('users')
          .select('*')
          .eq('email', email)
          .single();
      if(userInfo["deletado"] ==  true) {
        await supabase.from("users").update({
          'deletado': false,
          'level':1,
          'xp': 0,
          'forca': 0,
          'destreza': 0,
          'carisma': 0,
          'percepcao': 0,
          'inteligencia': 0,
          'agilidade': 0}).match(
            {'email': email});
      }
    } catch (error) {
      debugPrint('Erro ao fazer Relogin de conta deletada: -> $error');
    }
  }

  deleteUser() async{
    try{
      await supabase.auth.signOut();
      await supabase.from("users").update({'deletado': true}).match({'user_id': userSupabaseId});
      userSupabaseId = "";
      userSupabaseLogado = false;
    }
    catch(error){
      debugPrint('Erro ao deletar usuário -> $error');
    }
  }

  updatePassword(newPassword) async{
    try {
      final UserResponse res = await supabase.auth.updateUser(
        UserAttributes(
          password: newPassword,
        ),
      );
    }
    catch(error){
      debugPrint('Erro ao alterar senha -> $error');
    }
  }

  updateAtributos() async{
    try{
      await supabase.from('users').update({
        'level':usuario.nivel,
        'xp': usuario.xp,
        'forca': usuario.atributos.forca,
        'destreza': usuario.atributos.destreza,
        'carisma': usuario.atributos.carisma,
        'percepcao': usuario.atributos.percepcao,
        'inteligencia': usuario.atributos.inteligencia,
        'agilidade': usuario.atributos.agilidade
      }).match({'user_id':userSupabaseId});
    } catch(error){
      debugPrint('Erro ao atualizar atributos -> $error');
    }
  }

  // Função para verificar se usuário existe
  Future<void> checkUser(String email, String senha) async {
    try {
      // Tenta fazer login com email e senha no Supabase
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: senha,
      );
      final User? user = res.user;

      // Recebe as informações do usuário do Supabase
      Map<String, dynamic> userInfo = await supabase
          .from('users')
          .select('*')
          .eq('user_id', user?.id)
          .single();
      if(userInfo['deletado'] == false) {
        // Inicializa objeto usuário
        usuario =
            Usuario(userInfo["name"], userInfo["email"], userInfo["level"],
                userInfo["xp"]);
        // Atualiza atributos
        usuario.updateAtributos(
            userInfo["forca"],
            userInfo["destreza"],
            userInfo["carisma"],
            userInfo["percepcao"],
            userInfo["inteligencia"],
            userInfo["agilidade"]);
        // Printa as informações do usuário
        debugPrint(usuario.toString());
        userSupabaseId = user!.id; // Altera userID global
        userSupabaseLogado = true;
      } else {
        userSupabaseLogado = false;
        debugPrint('Erro ao fazer Login: -> Usuário deletado');
      }
    } catch (error) {
      debugPrint('Erro ao fazer Login: -> $error');
    }
  }
}
