import 'package:flutter/material.dart';
import 'package:myquestlog/utils/helper_widgets.dart';

class TarefasForm extends StatefulWidget {
  const TarefasForm({super.key});

  @override
  State<TarefasForm> createState() => _TarefasFormState();
}

class _TarefasFormState extends State<TarefasForm> {
  final _nome_tarefa_controller = TextEditingController();
  TextEditingController _tipo_tarefa_controller = TextEditingController();
  final _descricao_tarefa_controller = TextEditingController();
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
                  onPressed: (() =>
                      _tipo_tarefa_controller = 1 as TextEditingController),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                  ),
                  child: const Text("Força"),
                ),
                ElevatedButton(
                  onPressed: (() =>
                      _tipo_tarefa_controller = 1 as TextEditingController),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                  ),
                  child: const Text("Destreza"),
                ),
                ElevatedButton(
                  onPressed: (() =>
                      _tipo_tarefa_controller = 1 as TextEditingController),
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
                  onPressed: (() =>
                      _tipo_tarefa_controller = 1 as TextEditingController),
                  child: const Text("Percepção"),
                ),
                ElevatedButton(
                  onPressed: (() =>
                      _tipo_tarefa_controller = 1 as TextEditingController),
                  child: const Text("Inteligencia"),
                ),
                ElevatedButton(
                  onPressed: (() =>
                      _tipo_tarefa_controller = 1 as TextEditingController),
                  child: const Text("Agilidade"),
                ),
              ],
            ),
            addVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
