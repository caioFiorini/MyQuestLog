import 'package:flutter/material.dart';
import 'package:myquestlog/Routers/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:myquestlog/components/tarefas_user.dart';
import 'package:myquestlog/models/tarefas.dart';

class PageJuliana extends StatefulWidget {
  const PageJuliana({super.key});

  @override
  State<PageJuliana> createState() => _PageJulianaState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _PageJulianaState extends State<PageJuliana> {
  String dropdownValue = list.first;

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
        backgroundColor: const Color(0xFF2E2E2E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 110,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF606060),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
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
        children: const <Widget>[
          TarefasUser(),
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
