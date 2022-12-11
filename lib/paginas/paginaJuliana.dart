import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myquestlog/Routers/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:myquestlog/components/tarefas_form.dart';
import 'package:myquestlog/models/tarefas.dart';

import '../components/tarefas_list.dart';

class PageJuliana extends StatefulWidget {
  const PageJuliana({super.key});

  @override
  State<PageJuliana> createState() => _PageJulianaState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _PageJulianaState extends State<PageJuliana> {
  String dropdownValue = list.first;

  final List<Tarefas> _tarefas = [];

  List<Tarefas> get _recentTarefas {
    return _tarefas.where((tf) {
      return tf.data.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTarefa(String nomeTarefa, String descricaoTarefa, int tipoTarefa,
      DateTime date) {
    final novaTarefa = Tarefas(
      id: Random().nextDouble().toString(),
      nome_tarefa: nomeTarefa,
      descricao_tarefa: descricaoTarefa,
      tipo_tarefa: tipoTarefa,
      data: date,
    );

    setState(() {
      _tarefas.add(novaTarefa);
    });

    Navigator.of(context).pop();
  }

  _removeTarefas(String id) {
    setState(() {
      _tarefas.removeWhere((tr) => tr.id == id);
    });
  }

  _open_transaction_modal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TarefasForm(_addTarefa);
      },
    );
  }

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
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
              ),
            )
          ],
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: TarefasList(_tarefas, _removeTarefas),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _open_transaction_modal(context),
        child: Icon(Icons.add),
        backgroundColor: const Color(0xFFC99F0D),
      ),
    );
  }
}
