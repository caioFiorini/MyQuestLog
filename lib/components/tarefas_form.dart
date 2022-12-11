import 'package:flutter/material.dart';
import 'package:myquestlog/utils/helper_widgets.dart';

class TarefasForm extends StatefulWidget {
  final void Function(String, String, int, DateTime) onSubmit;
  TarefasForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TarefasForm> createState() => _TarefasFormState();
}

class _TarefasFormState extends State<TarefasForm> {
  final _nome_tarefa_controller = TextEditingController();
  final _descricao_tarefa_controller = TextEditingController();
  int value = 0;
  String? titulo, descricao;
  final DateTime _selectedDate = DateTime.now();

  _submitForm() {
    titulo = _nome_tarefa_controller.text;
    descricao = _descricao_tarefa_controller.text;

    if (titulo == null || descricao == null || value <= 0) {
      return;
    }
    widget.onSubmit(titulo!, descricao!, value, _selectedDate);
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
                  onPressed: (() => value = value + 1),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                  ),
                  child: const Text("Força"),
                ),
                ElevatedButton(
                  onPressed: (() => value = value + 1),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                  ),
                  child: const Text("Destreza"),
                ),
                ElevatedButton(
                  onPressed: (() => value = value + 1),
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
                  onPressed: (() => value = value + 1),
                  child: const Text("Percepção"),
                ),
                ElevatedButton(
                  onPressed: (() => value = value + 1),
                  child: const Text("Inteligencia"),
                ),
                ElevatedButton(
                  onPressed: (() => value = value + 1),
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
