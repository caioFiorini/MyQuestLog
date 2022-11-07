import 'package:flutter/material.dart';
import 'Routers/routes.dart';
import 'package:go_router/go_router.dart';

class PageJuliana extends StatefulWidget {
  const PageJuliana({super.key});

  @override
  State<PageJuliana> createState() => _PageJulianaState();
}

class _PageJulianaState extends State<PageJuliana> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      appBar: AppBar(
          backgroundColor: const Color(0xFF2E2E2E),
          automaticallyImplyLeading: true, //retira a seta de voltar
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Tarefas",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFC99F0D))),
      drawer: Drawer(
        backgroundColor: const Color(0xFF606060),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 110,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: TextButton(
                onPressed: () => context.push(
                    '/user_page/pagina_configuracao'), //modificar para ir para a página
                child: const Text(
                  "Configuração",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              iconColor: Colors.white,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Color(0xFF606060),
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: const Text(
                          "Tarefa1",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: const Text(
                          "Ir para academia",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Color(0xFF606060),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: const Text(
                          "Tarefa2",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: const Text(
                          "Estudar Flutter",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          "+",
          style: TextStyle(
            color: Color(0xFF2E2E2E),
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color(0xFFC99F0D),
      ),
    );
  }
}
