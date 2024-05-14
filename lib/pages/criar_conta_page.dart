import 'package:flutter/material.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/pages/screen_inicial.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({super.key});

  @override
  State<CriarContaPage> createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(125, 252, 99, 34),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ScreenInicial()));
          },
        ),
        title: const Text('CRIAR CONTA',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      backgroundColor: Color.fromARGB(125, 96, 24, 24),
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
                      label: Text(
                        'E-mail',
                        selectionColor: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0, top: 16.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text('Senha'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      bottom: 16.0, left: 16.0, right: 16.0, top: 16.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(
                        'Nome completo',
                        selectionColor: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(125, 252, 99, 34),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: const Text('CRIAR',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
