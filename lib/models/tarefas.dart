class Tarefas {
  final String id;
  final String nome_tarefa;
  final String descricao_tarefa;
  final int tipo_tarefa;
  final DateTime data;
  Tarefas({
    required this.id,
    required this.nome_tarefa,
    required this.tipo_tarefa,
    required this.data,
    required this.descricao_tarefa,
  });
}
