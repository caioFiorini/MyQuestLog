import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'database/database.dart';

class Tela_Login extends StatefulWidget {
  @override
  _Tela_Login createState() {
    return _Tela_Login();
  }
}

class _Tela_Login extends State<Tela_Login> {
  Database_MyQuesLog database_myQuesLog = Database_MyQuesLog();
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller_email = TextEditingController();
    TextEditingController _controller_senha = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF606060),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5.0,
              ),

              //greeting text

              Text(
                "My Quest",
                style: GoogleFonts.secularOne(
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFC99F0D),
                ),
              ),

              Text(
                "Log",
                style: GoogleFonts.secularOne(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFC99F0D)),
              ),

              const SizedBox(
                height: 5.0,
              ),

              const Text(
                'Bem Vindo',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFC99F0D),
                ),
              ),

              const SizedBox(
                height: 40.0,
              ),

              //email text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                      controller: _controller_email,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),

              //password text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                      controller: _controller_senha,
                    ),
                  ),
                ),
              ),

              //login button
              const SizedBox(
                height: 20.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (await database_myQuesLog.usuario_existe(
                        _controller_email.text, _controller_senha.text)) {
                      context.push('/login/home_page');
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC99F0D),
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFF2E2E2E),
                    ),
                  ),
                ),
              ),
              //not a member? register now

              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não é Membro? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go(
                        '/login/registro'), //modificar para ir para a página
                    child: const Text(
                      "Cadastre-se",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
