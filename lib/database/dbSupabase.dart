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
      final data = await supabase.from('users').upsert(
          {'name': name, 'user_id': authRes.user!.id, 'email': email});
      // Atualiza classe global do id usuario Supabase
      userSupabaseId = authRes.user!.id;
      //debugPrint('\n\nUser ID: $userSupabaseId\n\n'); // Apenas para teste
    } catch (error){
      debugPrint('Erro ao fazer cadastro -> $error');
    }
  }

  // Função para verificar se usuário existe
  Future<void> checkUser(String email, String senha) async{
    try {
      // Tenta fazer login com email e senha no Supabase
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: senha,
      );
      final User? user = res.user;

      userSupabaseId = user!.id; // Altera userID global
      userSupabaseLogado = true;

      // Recebe as informações do usuário do Supabase
      final Map<String, dynamic> userInfo = await supabase.from('users').select('*').eq('user_id', userSupabaseId).single();
      // Inicializa objeto usuário
      usuario = Usuario(userInfo["name"], userInfo["email"], userInfo["level"], userInfo["xp"]);
      // Atualiza atributos
      usuario.updateAtributos(userInfo["forca"], userInfo["destreza"], userInfo["carisma"], userInfo["percepcao"], userInfo["inteligencia"], userInfo["agilidade"]);
      // Printa as informações do usuário
      debugPrint(usuario.toString());
    } catch (error){
      debugPrint('Erro ao fazer Login: -> $error');
    }
  }
}

