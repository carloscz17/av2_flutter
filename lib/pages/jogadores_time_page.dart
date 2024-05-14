import 'package:flutter/material.dart';
import 'package:flutter_application/pages/lista_time_page.dart';

class JogadoresTimePage extends StatelessWidget {
  final String time;
  final Map<String, List<String>> jogadoresPorTime = {
    "Flamengo": ["Bruno Henrique", "Arrascaeta", "De La Cruz", "Gabigol", "Vina"],
    "Fluminense": ["Thiago Silva", "Marcelo", "Felipe Melo", "Cano", "Andre"],
    "São Paulo": ["Calleri", "James Rodriguez", "Luciano", "Rafael", "Lucas"],
    "Corinthians": ["Cássio", "Frosty", "Raniele", "Wesley", "Piton"],
    "Grêmio": ["Diego Costa", "Bitello", "Pavón", "Soteldo", "Cristaldo"]
  };

  JogadoresTimePage({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    final jogadores = jogadoresPorTime[time] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Jogadores do $time'),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => EscolhaTimePage()));
          }
        ),
      ),
      body: ListView.builder(
        itemCount: jogadores.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(jogadores[index]),
              onTap: () {
                Navigator.pop(context, jogadores[index]); // Retorna o nome do jogador selecionado
              },
            ),
          );
        },
      ),
    );
  }
}
