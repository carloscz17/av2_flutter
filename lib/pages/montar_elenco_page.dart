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
  String? nomeTecnico; // Variável para armazenar o nome do técnico selecionado.
  Map<String, String> nomesJogadores = {}; // Armazena os nomes dos jogadores por posição.

  @override
  void initState() {
    super.initState();
    loadSelectedTechnician(); // Carrega o técnico selecionado do armazenamento local ao iniciar.
    loadPlayerNames(); // Carrega os nomes dos jogadores do armazenamento local ao iniciar.
  }

  // Salva o nome do técnico no SharedPreferences.
  Future<void> saveSelectedTechnician(String technicianName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedTechnician', technicianName);
  }

  // Carrega o nome do técnico salvo do SharedPreferences.
  Future<void> loadSelectedTechnician() async {
    final prefs = await SharedPreferences.getInstance();
    String? technicianName = prefs.getString('selectedTechnician');
    if (technicianName != null) {
      setState(() {
        nomeTecnico = technicianName;
      });
    }
  }

  // Salva o nome do jogador no SharedPreferences para uma dada posição.
  Future<void> savePlayerName(String position, String playerName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(position, playerName);
    nomesJogadores[position] = playerName;
  }

  // Carrega os nomes dos jogadores para cada posição do SharedPreferences.
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
        title: const Text('MONTAR ELENCO', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      backgroundColor: Color.fromARGB(125, 96, 24, 24),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
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

                const SizedBox(height: 10),

                const Text("Técnico", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(125, 252, 99, 34)),
                    onPressed: () async {
                      final resultado = await Navigator.push(context, MaterialPageRoute(builder: (context) => TecnicosPage()));
                      if (resultado != null) {
                        setState(() {
                          nomeTecnico = resultado;
                        });
                        saveSelectedTechnician(resultado); // Salva o técnico selecionado.
                      }
                    },
                    child: Text(nomeTecnico ?? 'Técnico', style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget para criar botões de jogador, que ao clicar leva para a seleção de jogador.
  Widget botaoJogador(String posicao) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(125, 252, 99, 34)),
          onPressed: () async {
            var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => EscolhaTimePage()));
            if (result != null && result['player'] != null) {
              setState(() {
                savePlayerName(posicao, result['player']); // Salva o nome do jogador selecionado.
              });
            }
          },
          child: Text(nomesJogadores[posicao] ?? posicao,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            )
          ),
        ),
      ),
    );
  }
}
