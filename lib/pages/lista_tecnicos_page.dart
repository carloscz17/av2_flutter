import 'package:flutter/material.dart';
import 'package:flutter_application/pages/montar_elenco_page.dart';

class TecnicosPage extends StatefulWidget {
  const TecnicosPage({super.key});

  @override
  State<TecnicosPage> createState() => _TecnicosPageState();
}

class _TecnicosPageState extends State<TecnicosPage> {

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
          backgroundColor: Color.fromARGB(125, 252, 99, 34),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MontarElencoPage()));
            },
          ),
          title: Text('LISTA TÉCNICOS'),
        ),
        backgroundColor: Color.fromARGB(125, 96, 24, 24),
              body: ListView.builder(
        itemCount: tecnicos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tecnicos[index]),
            onTap: () {
              Navigator.pop(context, tecnicos[index]); // Retorna o nome do técnico selecionado
            },
          );
        },
      ),
    );
  }
}