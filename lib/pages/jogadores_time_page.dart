import 'package:flutter/material.dart';
import 'package:flutter_application/pages/lista_time_page.dart';

// Classe StatelessWidget para exibir a lista de jogadores de um time específico
class JogadoresTimePage extends StatelessWidget {
  final String time; // Nome do time passado como parâmetro
  // Dicionário contendo os jogadores de cada time
  final Map<String, List<String>> jogadoresPorTime = {
    "Flamengo": [
      "Bruno Henrique",
      "Arrascaeta",
      "De La Cruz",
      "Gabigol",
      "Vina"
    ],
    "Fluminense": ["Thiago Silva", "Marcelo", "Felipe Melo", "Cano", "Andre"],
    "São Paulo": ["Calleri", "James Rodriguez", "Luciano", "Rafael", "Lucas"],
    "Corinthians": ["Cássio", "Frosty", "Raniele", "Wesley", "Piton"],
    "Grêmio": ["Diego Costa", "Bitello", "Pavón", "Soteldo", "Cristaldo"]
  };

  JogadoresTimePage({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    final jogadores = jogadoresPorTime[time] ?? []; // Recupera a lista de jogadores do time

    return Scaffold(
      appBar: AppBar(
        title: Text('Jogadores do $time', // Título da AppBar mostra o time selecionado
        style: const TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.deepOrange, // Cor da AppBar
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,), // Botão para voltar
            onPressed: () {
              // Retorna à página de seleção de time
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EscolhaTimePage()));
            }),
      ),
      backgroundColor: Color.fromARGB(125, 125, 24, 24), // Cor de fundo da página
      body: Padding(
        padding: const EdgeInsets.only(
          top: 12,
        ),
        child: ListView.builder(
          itemCount: jogadores.length, // Contagem de itens é baseada no número de jogadores
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.person), // Ícone para cada jogador
                title: Text(
                  jogadores[index], // Nome do jogador
                  style: const TextStyle(color: Colors.black), // Estilo do texto
                ),
                onTap: () {
                  // Retorna o nome do jogador selecionado para a página anterior
                  Navigator.pop(context, jogadores[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
