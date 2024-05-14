import 'package:flutter/material.dart';
import 'package:flutter_application/pages/montar_elenco_page.dart';
import 'jogadores_time_page.dart'; // Certifique-se de que este import está correto

class EscolhaTimePage extends StatelessWidget {
  EscolhaTimePage({super.key});

  final List<String> times = [
    "Flamengo",
    "Fluminense",
    "São Paulo",
    "Corinthians",
    "Grêmio"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escolha seu Time"),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MontarElencoPage()));
          },
        ),
      ),
      backgroundColor: Color.fromARGB(125, 125, 24, 24),
      body: ListView.builder(
        itemCount: times.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.sports_soccer),
              title: Text(times[index],
              style: const TextStyle(
                color: Colors.black
              ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JogadoresTimePage(time: times[index])),
                ).then((selectedPlayer) {
                  if (selectedPlayer != null) {
                    Navigator.pop(context, {"team": times[index], "player": selectedPlayer});
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
