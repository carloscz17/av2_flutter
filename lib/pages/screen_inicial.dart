import 'package:flutter/material.dart';
import 'package:flutter_application/pages/criar_conta_page.dart';
import 'package:flutter_application/pages/login_page.dart';

// Define um StatefulWidget para a tela inicial do aplicativo
class ScreenInicial extends StatefulWidget {
  const ScreenInicial({super.key});

  @override
  State<ScreenInicial> createState() => _ScreenInicialState();
}

class _ScreenInicialState extends State<ScreenInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(125, 96, 24, 24), // Define a cor de fundo da tela
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView( // Permite rolagem se o conteúdo exceder a tela
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 250), // Espaçamento superior
                  child: Image.asset(
                    'assets/images/logo_cartola.png', // Logo do aplicativo
                    width: 300,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50), // Espaçamento entre elementos
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(125, 252, 99, 34), // Cor do botão
                          ),
                          onPressed: () {
                            // Navega para a página de login
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: const Text('FAZER LOGIN',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20)), // Texto do botão
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10), // Espaçamento entre botões
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(125, 252, 99, 34), // Cor do botão
                          ),
                          onPressed: () {
                            // Navega para a página de criar conta
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CriarContaPage()));
                          },
                          child: const Text('CRIAR CONTA',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20)), // Texto do botão
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ))
      ])
    );
  }
}
