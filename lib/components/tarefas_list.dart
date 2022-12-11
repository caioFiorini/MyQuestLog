import 'package:flutter/material.dart';
import 'package:myquestlog/models/tarefas.dart';
import 'package:myquestlog/utils/helper_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TarefasList extends StatelessWidget {
  final List<Tarefas> tarefas;
  final void Function(String) onRemove;
  const TarefasList(this.tarefas, this.onRemove, {Key? key}) : super(key: key);

  _removerDados() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nomeTarefa");
    prefs.remove("Xp");
  }

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${tf.nome_tarefa}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              addHorizontalSpace(15),
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
                          IconButton(
                            onPressed: () {
                              onRemove(tf.nome_tarefa);
                              //_removerDados();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
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
        },
      ),
    );
  }
}
