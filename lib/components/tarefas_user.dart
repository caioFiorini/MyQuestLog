import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myquestlog/components/tarefas_form.dart';
import 'package:myquestlog/components/tarefas_list.dart';
import '../models/tarefas.dart';

class TarefasUser extends StatefulWidget {
  const TarefasUser({super.key});

  @override
  State<TarefasUser> createState() => TarefasUserState();
}

class TarefasUserState extends State<TarefasUser> {
  final List<Tarefas> _tarefas = [];

  _addTarefa(String nomeTarefa, String tipoTarefa) {
    final novaTarefa = Tarefas(
      id: Random().nextDouble().toString(),
      nome_tarefa: nomeTarefa,
      tipo_tarefa: tipoTarefa,
      data: DateTime.now(),
    );

    setState(() {
      _tarefas.add(novaTarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TarefasList(_tarefas),
        const TarefasForm(),
      ],
    );
  }
}
