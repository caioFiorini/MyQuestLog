import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class Tela_Login extends StatefulWidget {
  @override
  _Tela_Login createState() {
    return _Tela_Login();
  }
}

class _Tela_Login extends State<Tela_Login> {
  Color c = const Color(0xFF993300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfcf0cf),
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
                child: ElevatedButton(
                  onPressed: () => context.push('/login/home_page'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF993300),
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
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
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
<<<<<<< HEAD
                  ElevatedButton(
                    onPressed: null, //modificar para ir para a página
                    child: Text(
                      "Cadastre-se",
=======
                  TextButton(
                    onPressed: () => context.push('/login/registro'),
                    child: const Text(
                      'Registre agora',
>>>>>>> caio
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
