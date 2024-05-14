import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';

// StatefulWidget para gerenciar o estado da tela de melhores pontuadores
class PontuadoresPage extends StatefulWidget {
  const PontuadoresPage({super.key});

  @override
  _PontuadoresPageState createState() => _PontuadoresPageState();
}

class _PontuadoresPageState extends State<PontuadoresPage> {
  List<Jogador> jogadores = []; // Lista para armazenar os jogadores
  bool ascending = true; // Controla a direção da ordenação

  @override
  void initState() {
    super.initState();
    var nomes = [ // Lista de nomes de jogadores
      "Cássio", "Frosty", "Raniele", "Wesley", "Piton",
      "Diego Costa", "Bitello", "Pavón", "Soteldo", "Cristaldo",
      "Thiago Silva", "Marcelo", "Felipe Melo", "Cano", "Andre",
      "Calleri", "James Rodriguez", "Luciano", "Rafael", "Lucas"
    ];
    nomes.shuffle(); // Embaralha a lista de nomes para aleatoriedade
    jogadores = List.generate(10, (index) {
      // Gera uma lista de 10 jogadores com nomes e pontuações aleatórias
      return Jogador(nome: nomes[index], pontuacao: Random().nextDouble() * 20);
    });
    jogadores.sort((a, b) => a.pontuacao.compareTo(b.pontuacao)); // Ordena jogadores pela pontuação inicialmente
  }

  void sortPlayers() { // Função para ordenar os jogadores
    setState(() {
      if (ascending) {
        jogadores.sort((a, b) => b.pontuacao.compareTo(a.pontuacao)); // Ordena decrescentemente
      } else {
        jogadores.sort((a, b) => a.pontuacao.compareTo(b.pontuacao)); // Ordena crescentemente
      }
      ascending = !ascending; // Alterna a direção da ordenação
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MELHORES PONTUADORES",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => const HomePage())));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              ascending ? Icons.arrow_upward : Icons.arrow_downward,
              color: Colors.white,
            ),
            onPressed: sortPlayers, // Botão para alternar a ordenação
          )
        ],
      ),
      backgroundColor: Color.fromARGB(125, 125, 24, 24),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 12,
        ),
        child: ListView.builder(
          itemCount: jogadores.length,
          itemBuilder: (context, index) {
            Jogador jogador = jogadores[index];
            return Card (
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: Text(
                  jogador.nome,
                  style: const TextStyle(color: Colors.black),
                ),
                trailing: Text(
                  "${jogador.pontuacao.toStringAsFixed(2)} pts", // Mostra a pontuação formatada
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Classe Jogador para armazenar informações de cada jogador
class Jogador {
  String nome;
  double pontuacao;

  Jogador({required this.nome, required this.pontuacao});
}
