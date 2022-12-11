import 'package:flutter/material.dart';
import 'package:myquestlog/models/tarefas.dart';
import 'package:myquestlog/utils/helper_widgets.dart';

class TarefasList extends StatelessWidget {
  final List<Tarefas> tarefas;
  final void Function(String) onRemove;
  const TarefasList(this.tarefas, this.onRemove, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (ctx, index) {
          final tf = tarefas[index];
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
                        children: [
                          Text(
                            '${tf.nome_tarefa}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          addHorizontalSpace(140),
                          Text(
                            '${tf.tipo_tarefa} XP',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
