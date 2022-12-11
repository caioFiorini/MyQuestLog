import 'package:myquestlog/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

class dbSupabase {
  // Supabase Database Functions
  createUser(String email, String password, String name) async {
    try {
      final AuthResponse authRes = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      final data = await supabase.from('users').upsert(
          {'name': name, 'user_id': authRes.user!.id, 'email': email});
      userSupabaseId = authRes.user!.id;

      debugPrint('\n\nUser ID: $userSupabaseId\n\n'); // Apenas para teste
    } catch (error){
      debugPrint('Erro ao fazer cadastro -> $error');
    }
  }

  // Função para verificar se usuário existe
  Future<void> checkUser(String email, String senha) async{
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: senha,
      );
      final User? user = res.user;

      userSupabaseId = user!.id; // Altera userID global
      userSupabaseLogado = true;

      var userEmail = user!.email; // Apenas para teste
      debugPrint('\nUser logado: $userEmail\n'); // Apenas para teste
    } catch (error){
      debugPrint('Erro ao fazer Login: -> $error');
    }
  }
}

