import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tela_Login extends StatefulWidget {
  @override
  _Tela_Login createState() {
    return _Tela_Login();
  }
}

class _Tela_Login extends State<Tela_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4D7),
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
                  color: const Color(0xFF993300),
                ),
              ),

              Text(
                "Log",
                style: GoogleFonts.secularOne(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF993300)),
              ),

              const SizedBox(
                height: 5.0,
              ),

              const Text(
                'Bem Vindo',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF993300),
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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
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
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF993300),
                  ),
                  child: const Center(
                      child: Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  )),
                ),
              ),
              //not a member? register now

              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Não é Membro? ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: null, //modificar para ir para a página
                    child: Text(
                      "Cadastre-se",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
