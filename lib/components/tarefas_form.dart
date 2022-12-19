import 'package:flutter/material.dart';
import 'package:myquestlog/main.dart';
import 'package:myquestlog/utils/helper_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myquestlog/database/database.dart';

class TarefasForm extends StatefulWidget {
  final void Function(String, int, DateTime) onSubmit;
  TarefasForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TarefasForm> createState() => _TarefasFormState();
}

class _TarefasFormState extends State<TarefasForm> {
  final _nome_tarefa_controller = TextEditingController();
  int value = 0;
  bool botao_f = true;
  bool botao_d = true;
  bool botao_c = true;
  bool botao_p = true;
  bool botao_i = true;
  bool botao_a = true;
  String? titulo;
  final DateTime _selectedDate = DateTime.now();
  late final String? _textoSalvo;

  _submitForm() {
    titulo = _nome_tarefa_controller.text;

    tarefas.salvar_dados(_nome_tarefa_controller.text, value, _selectedDate);

    if (titulo == null || value <= 0) {
      return;
    }
    // Adiciona o xp ao usuário
    usuario.addXP(value);

    widget.onSubmit(titulo!, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF606060),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(10),
            const Text(
              "Tarefa:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            addVerticalSpace(10),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 150,
              ),
              child: TextField(
                maxLines: null,
                maxLength: 150,
                controller: _nome_tarefa_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF434141),
                  counterStyle: const TextStyle(color: Colors.white),
                ),
                style: const TextStyle(
                  color: Color(0xFFC99F0D),
                ),
              ),
            ),
            addVerticalSpace(8),
            const Text(
              "Tipo de atributo usado para essa tarefa:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (botao_f
                      ? () {
                          setState(() {
                            value = value + 1;
                            botao_f = false;
                          });
                        }
                      : null),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  )),
                  child: const Text("Força"),
                ),
                ElevatedButton(
                  onPressed: (botao_d
                      ? () {
                          setState(() {
                            value = value + 1;
                            botao_d = false;
                          });
                        }
                      : null),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                  ),
                  child: const Text("Destreza"),
                ),
                ElevatedButton(
                  onPressed: (botao_c
                      ? () {
                          setState(() {
                            value = value + 1;
                            botao_c = false;
                          });
                        }
                      : null),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                  child: const Text("Carisma"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (botao_p
                      ? () {
                          setState(() {
                            value = value + 1;
                            botao_p = false;
                          });
                        }
                      : null),
                  child: const Text("Percepção"),
                ),
                ElevatedButton(
                  onPressed: (botao_i
                      ? () {
                          setState(() {
                            value = value + 1;
                            botao_i = false;
                          });
                        }
                      : null),
                  child: const Text("Inteligencia"),
                ),
                ElevatedButton(
                  onPressed: (botao_a
                      ? () {
                          setState(() {
                            value = value + 1;
                            botao_a = false;
                          });
                        }
                      : null),
                  child: const Text("Agilidade"),
                ),
              ],
            ),
            addVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("Cadastrar Tarefa"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
