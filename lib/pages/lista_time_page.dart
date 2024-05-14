import 'package:flutter/material.dart';
import 'package:flutter_application/pages/montar_elenco_page.dart';
import 'jogadores_time_page.dart'; // Importa a página dos jogadores do time

// Classe StatelessWidget para a página de escolha de times
class EscolhaTimePage extends StatelessWidget {
  EscolhaTimePage({super.key});

  final List<String> times = [
    "Flamengo",
    "Fluminense",
    "São Paulo",
    "Corinthians",
    "Grêmio"
  ]; // Lista dos times disponíveis para escolha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escolha seu Time", // Título da AppBar
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.deepOrange, // Cor da AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            // Ação para voltar para a página Montar Elenco
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MontarElencoPage()));
          },
        ),
      ),
      backgroundColor: Color.fromARGB(125, 125, 24, 24), // Cor de fundo da página
      body: Padding(
        padding: const EdgeInsets.only(
          top: 12,
        ),
        child: ListView.builder(
          itemCount: times.length, // Define o número de itens com base no número de times
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.sports_soccer), // Ícone representando o esporte
                title: Text(times[index], // Nome do time
                style: const TextStyle(
                  color: Colors.black
                ),),
                onTap: () {
                  // Ação ao tocar no item, navega para a página dos jogadores do time selecionado
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JogadoresTimePage(time: times[index])),
                  ).then((selectedPlayer) {
                    // Retorna o jogador selecionado para a página anterior
                    if (selectedPlayer != null) {
                      Navigator.pop(context, {"team": times[index], "player": selectedPlayer});
                    }
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
