import 'package:flutter/material.dart';
import 'package:flutter_application/pages/entrar_contato_page.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/pages/melhores_pontuadores_page.dart';
import 'package:flutter_application/pages/montar_elenco_page.dart';
import 'package:flutter_application/pages/sobre_app_page.dart';
import 'package:flutter_application/pages/termos_servicos_page.dart';

// StatefulWidget para gerenciar o estado da tela inicial da aplicação
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(125, 252, 99, 34), // Define a cor da AppBar
        title: const Text('HOME', // Título na AppBar
        style: TextStyle(
          color: Colors.white
        ),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white,),
            onPressed: () {
              // Redireciona para a página de login e remove todas as rotas anteriores
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(125, 96, 24, 24), // Define a cor de fundo da página
      drawer: Drawer( // Drawer para navegação entre páginas
        child: ListView( 
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(  // Cabeçalho do Drawer
              decoration: const BoxDecoration(
                color: Color.fromARGB(125, 252, 99, 34),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/logo_cartola.png', width: 300), // Logo no Drawer
                ],
              )
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Entrar em Contato'),
              onTap: () {
                // Navega para a página de contato
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EntrarEmContatoPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre o Aplicativo'),
              onTap: () {
                // Navega para a página sobre o aplicativo
                Navigator.of(context).pop(); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SobreAppPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text('Termos e Serviços'),
              onTap: () {
                // Navega para a página de termos e serviços
                Navigator.of(context).pop();  
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermosEServicosPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Image.asset(
                    'assets/images/logo_cartola.png',
                    width: 300, // Exibe o logo centralizado na página
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(125, 252, 99, 34),
                    ),
                    onPressed: () {
                      // Navega para a página de pontuação
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PontuadoresPage()));
                    },
                    child: const Text('PONTUAÇÃO',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(125, 252, 99, 34),
                    ),
                    onPressed: () {
                      // Navega para a página de montar elenco
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MontarElencoPage()));
                    },
                    child: const Text('MONTAR ELENCO',
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
