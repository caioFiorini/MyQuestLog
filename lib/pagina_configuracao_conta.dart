import 'package:flutter/material.dart';
import 'database/database.dart';
import 'Routers/routes.dart';
import 'package:go_router/go_router.dart';

class ContaConfig extends StatefulWidget {
  const ContaConfig({super.key});

  @override
  State<ContaConfig> createState() => _ContaConfigState();
}

class _ContaConfigState extends State<ContaConfig> {
  TextEditingController controller_email_delete = TextEditingController();
  TextEditingController controller_email_update = TextEditingController();
  TextEditingController controller_senha_update = TextEditingController();
  TextEditingController controller_nova_senha_update = TextEditingController();

  Database_MyQuesLog database_myQuesLog = Database_MyQuesLog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      appBar: AppBar(
          backgroundColor: const Color(0xFF2E2E2E),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Minha Conta",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFC99F0D))),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Digite seu email para deletar a conta:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 220,
                    decoration: BoxDecoration(
                      color: const Color(0xFF606060),
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email:',
                            hintStyle: TextStyle(color: Colors.white)),
                        controller: controller_email_delete,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      database_myQuesLog
                          .excluir_usuario(controller_email_delete.text);
                      context.push('/');
                    },
                    child: const Text(
                      "Deletar",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Digite seu email para mudar a senha:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 330,
                    decoration: BoxDecoration(
                      color: const Color(0xFF606060),
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email:',
                            hintStyle: TextStyle(color: Colors.white)),
                        controller: controller_email_update,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 330,
                    decoration: BoxDecoration(
                      color: const Color(0xFF606060),
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
                            hintStyle: TextStyle(color: Colors.white)),
                        controller: controller_senha_update,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 330,
                    decoration: BoxDecoration(
                      color: const Color(0xFF606060),
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nova Senha:',
                            hintStyle: TextStyle(color: Colors.white)),
                        controller: controller_nova_senha_update,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await database_myQuesLog.usuario_existe(
                      controller_email_update.text,
                      controller_senha_update.text)) {
                    database_myQuesLog.atualizar_usuario_senha(
                        controller_email_update.text,
                        controller_nova_senha_update.text);
                    context.push('/');
                  } else {}
                },
                child: const Text(
                  "Atualizar Senha",
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
