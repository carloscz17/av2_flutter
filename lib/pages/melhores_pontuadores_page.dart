import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';

class PontuadoresPage extends StatefulWidget {
  const PontuadoresPage({super.key});

  @override
  _PontuadoresPageState createState() => _PontuadoresPageState();
}

class _PontuadoresPageState extends State<PontuadoresPage> {
  List<Jogador> jogadores = [];
  bool ascending = true;

  @override
  void initState() {
    super.initState();
    var nomes = [
      "Cássio",
      "Frosty",
      "Raniele",
      "Wesley",
      "Piton",
      "Diego Costa",
      "Bitello",
      "Pavón",
      "Soteldo",
      "Cristaldo",
      "Thiago Silva",
      "Marcelo",
      "Felipe Melo",
      "Cano",
      "Andre",
      "Calleri",
      "James Rodriguez",
      "Luciano",
      "Rafael",
      "Lucas"
    ];
    nomes.shuffle();
    jogadores = List.generate(10, (index) {
      return Jogador(nome: nomes[index], pontuacao: Random().nextDouble() * 20);
    });
    jogadores.sort((a, b) => a.pontuacao.compareTo(b.pontuacao));
  }

  void sortPlayers() {
    setState(() {
      if (ascending) {
        jogadores.sort((a, b) => b.pontuacao.compareTo(a.pontuacao));
      } else {
        jogadores.sort((a, b) => a.pontuacao.compareTo(b.pontuacao));
      }
      ascending = !ascending;
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
            onPressed: sortPlayers,
          )
        ],
      ),
      backgroundColor: Color.fromARGB(125, 125, 24, 24),
      body: ListView.builder(
        itemCount: jogadores.length,
        itemBuilder: (context, index) {
          Jogador jogador = jogadores[index];
          return ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text(
              jogador.nome,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: Text(
              "${jogador.pontuacao.toStringAsFixed(2)} pts",
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

class Jogador {
  String nome;
  double pontuacao;

  Jogador({required this.nome, required this.pontuacao});
}
