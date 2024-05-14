import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/lista_tecnicos_page.dart';
import 'package:flutter_application/pages/lista_time_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MontarElencoPage extends StatefulWidget {
  const MontarElencoPage({super.key});

  @override
  State<MontarElencoPage> createState() => _MontarElencoPageState();
}

class _MontarElencoPageState extends State<MontarElencoPage> {
  String? nomeTecnico; // Variável de estado para armazenar o nome do técnico
  Map<String, String> nomesJogadores = {}; // Armazena os nomes dos jogadores por posição

  @override
  void initState() {
    super.initState();
    loadSelectedTechnician();
    loadPlayerNames();
  }

  Future<void> saveSelectedTechnician(String technicianName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedTechnician', technicianName);
  }

  Future<void> loadSelectedTechnician() async {
    final prefs = await SharedPreferences.getInstance();
    String? technicianName = prefs.getString('selectedTechnician');
    if (technicianName != null) {
      setState(() {
        nomeTecnico = technicianName;
      });
    }
  }

  Future<void> savePlayerName(String position, String playerName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(position, playerName);
    nomesJogadores[position] = playerName;
  }

  Future<void> loadPlayerNames() async {
    final prefs = await SharedPreferences.getInstance();
    Set<String> positions = {'Atacante 1', 'Atacante 2', 'Meio-Campo 1', 'Meio-Campo 2', 'Meio-Campo 3', 'Volante 1', 'Lateral 1', 'Zagueiro 1', 'Zagueiro 2', 'Lateral 2', 'Goleiro'};
    Map<String, String> loadedNames = {};
    for (String position in positions) {
      String? playerName = prefs.getString(position);
      if (playerName != null) {
        loadedNames[position] = playerName;
      }
    }
    if (loadedNames.isNotEmpty) {
      setState(() {
        nomesJogadores = loadedNames;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(125, 252, 99, 34),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: const Text('MONTAR ELENCO'),
      ),
      backgroundColor: Color.fromARGB(125, 96, 24, 24),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text("Atacantes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                botaoJogador('Atacante 1'),
                botaoJogador('Atacante 2'),
                const SizedBox(height: 10),
                const Text("Meio-Campistas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                botaoJogador('Meio-Campo 1'),
                botaoJogador('Meio-Campo 2'),
                botaoJogador('Meio-Campo 3'),
                const SizedBox(height: 10),
                const Text("Volantes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                botaoJogador('Volante 1'),
                const SizedBox(height: 10),
                const Text("Zagueiros", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                botaoJogador('Lateral 1'),
                botaoJogador('Zagueiro 1'),
                botaoJogador('Zagueiro 2'),
                botaoJogador('Lateral 2'),
                const SizedBox(height: 10),
                const Text("Goleiro", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                botaoJogador('Goleiro'),
                const Text("Técnico", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(125, 252, 99, 34),
                  ),
                  onPressed: () async {
                    final resultado = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TecnicosPage()),
                    );
                    if (resultado != null) {
                      setState(() {
                        nomeTecnico = resultado; // Atualiza o estado com o nome do técnico selecionado
                      });
                      saveSelectedTechnician(resultado);
                    }
                  },
                  child: Text(nomeTecnico ?? 'Técnico', // Mostra o nome do técnico selecionado
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget para criar botões de jogadores
  Widget botaoJogador(String posicao) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(125, 252, 99, 34) // Cor de fundo ajustada aqui
      ),
      onPressed: () async {
        var result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EscolhaTimePage()),
        );
        if (result != null && result['player'] != null) {
          setState(() {
            savePlayerName(posicao, result['player']); // Atualiza o nome do jogador selecionado e salva
          });
        }
      },
      child: Text(nomesJogadores[posicao] ?? posicao, // Mostra o nome do jogador ou a posição se não selecionado
        style: TextStyle(color: Colors.white), // Define a cor do texto como branco
      ),
    );
  }
}
