import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/screen_inicial.dart';

// Define um StatefulWidget para gerenciar o estado da tela de login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(125, 252, 99, 34), // Define a cor da AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navega de volta para a tela inicial ao clicar no ícone de voltar
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ScreenInicial()));
          },
        ),
        title: const Text('LOGIN', // Título na AppBar
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      backgroundColor: const Color.fromARGB(125, 96, 24, 24), // Cor de fundo da tela
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset('assets/images/logo_cartola.png', // Exibe o logo
                width: 300,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 32.0,
                  left: 16.0,
                  right: 16.0,
                  top: 32.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(
                        'E-mail',
                        selectionColor: Colors.white,),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white)
                        ),
                    ),
                  ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 24.0,
                  left: 16.0,
                  right: 16.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true, // Campo de senha com obscurecimento de texto
                  decoration: InputDecoration(
                    label: Text('Senha'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(125, 252, 99, 34),
                ),
                onPressed: () {
                  // Navega para a tela principal ao clicar no botão 'ENTRAR'
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: const Text('ENTRAR', // Texto do botão
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20)),
              ),
            ]
          ),
        )
      ],)
    );
  }
}
