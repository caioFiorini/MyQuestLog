import 'package:flutter/material.dart';
import 'package:myquestlog/Routers/routes.dart';
import 'package:go_router/go_router.dart';

class PageConfig extends StatefulWidget {
  const PageConfig({super.key});

  @override
  State<PageConfig> createState() => PageConfigState();
}

class PageConfigState extends State<PageConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      appBar: AppBar(
          backgroundColor: const Color(0xFF2E2E2E),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Configuração",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFC99F0D))),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          const SizedBox(height: 15),
          Card(
            clipBehavior: Clip.hardEdge,
            color: const Color(0xFF606060),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Modo Tela",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            clipBehavior: Clip.hardEdge,
            color: const Color(0xFF606060),
            child: InkWell(
              onTap: () {
                context.push('/pagina_configuracao/pagina_configuracao_conta');
              },
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Configuração Conta",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
