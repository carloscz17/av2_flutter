import 'package:flutter/material.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/pages/screen_inicial.dart';

// Define a StatefulWidget para gerenciar o estado da tela de criação de conta
class CriarContaPage extends StatefulWidget {
  const CriarContaPage({super.key});

  @override
  State<CriarContaPage> createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {

   bool ocultarSenha = true;

  IconData exibirIcon = Icons.visibility;
  IconData ocultar = Icons.visibility_off;

  void exibir() {
    setState(() {
      ocultarSenha = !ocultarSenha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(125, 252, 99, 34), // Define a cor do AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navega de volta para a tela inicial ao clicar no ícone de voltar
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ScreenInicial()));
          },
        ),
        title: const Text('CRIAR CONTA', // Título do AppBar
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      backgroundColor: Color.fromARGB(125, 96, 24, 24), // Define a cor de fundo da tela
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Image.asset(
                    'assets/images/logo_cartola.png',
                    width: 300,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      bottom: 16.0, left: 16.0, right: 16.0, top: 32.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.alternate_email),
                      label: Text(
                        'E-mail',
                        selectionColor: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0, top: 16.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: ocultarSenha, // Define o campo como senha
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(ocultarSenha ? exibirIcon : ocultar),
                      onPressed: exibir,
                    ),
                      label: const Text('Senha'),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      bottom: 24.0, left: 16.0, right: 16.0, top: 16.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      label: Text(
                        'Nome completo',
                        selectionColor: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(125, 252, 99, 34),
                    ),
                    onPressed: () {
                      // Navega para a tela de login após criar a conta
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text('CRIAR CONTA',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
