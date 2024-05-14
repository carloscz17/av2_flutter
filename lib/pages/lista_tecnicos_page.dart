import 'package:flutter/material.dart';
import 'package:flutter_application/pages/montar_elenco_page.dart';

// Define um StatefulWidget para gerenciar o estado da tela dos técnicos
class TecnicosPage extends StatefulWidget {
  const TecnicosPage({super.key});

  @override
  State<TecnicosPage> createState() => _TecnicosPageState();
}

class _TecnicosPageState extends State<TecnicosPage> {
  // Lista de nomes de técnicos
  final List<String> tecnicos = [
    "Tite",
    "Diniz",
    "Zubeldia",
    "Cuca",
    "Renato"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(125, 252, 99, 34), // Define a cor da AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navega de volta para a página de montar elenco
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MontarElencoPage()));
          },
        ),
        title: const Text('LISTA TÉCNICOS', // Título da página
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      backgroundColor: Color.fromARGB(125, 96, 24, 24), // Cor de fundo da tela
      body: ListView.builder(
        itemCount: tecnicos.length, // Define o número de itens na lista com base no número de técnicos
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tecnicos[index], // Mostra o nome do técnico
            style: const TextStyle(
              color: Colors.white
            ),),
            onTap: () {
              // Retorna o nome do técnico selecionado para a tela anterior quando um item da lista é tocado
              Navigator.pop(context, tecnicos[index]);
            },
          );
        },
      ),
    );
  }
}
