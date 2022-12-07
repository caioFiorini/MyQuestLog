import 'package:flutter/material.dart';
import 'package:myquestlog/models/tarefas.dart';

class TarefasList extends StatelessWidget {
  final List<Tarefas> tarefas;

  TarefasList(this.tarefas);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tarefas.map((tf) {
        return Card(
          clipBehavior: Clip.hardEdge,
          color: const Color(0xFF606060),
          child: InkWell(
            onTap: () {
              //context.push('/pagina_configuracao/pagina_configuracao_conta');
            },
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
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
        );
      }).toList(),
    );
  }
}
