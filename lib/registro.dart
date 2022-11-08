import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'database/database.dart';

class Registro extends StatefulWidget {
  @override
  _Registro createState() {
    return _Registro();
  }
}

class _Registro extends State<Registro> {
  // final valueController = TextEditingController();
  Database_MyQuesLog database_myQuesLog = Database_MyQuesLog();
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerNome = TextEditingController();
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerSenha = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF606060),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cadastro",
                style: GoogleFonts.secularOne(
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFC99F0D),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                        labelText: "Nome:",
                      ),
                      controller: controllerNome,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
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
                        hintText: 'Email:',
                      ),
                      controller: controllerEmail,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
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
                        hintText: 'Senha:',
                      ),
                      controller: controllerSenha,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC99F0D),
                ),
                onPressed: () {
                  database_myQuesLog.salvar_dados(controllerNome.text,
                      controllerEmail.text, controllerSenha.text);
                  //database_myQuesLog.salvar_dados(controllerNome.text);
                  context.go('/');
                },
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Color(0xFF2E2E2E),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
