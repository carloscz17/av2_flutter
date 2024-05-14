import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';

class SobreAppPage extends StatefulWidget {
  const SobreAppPage({super.key});

  @override
  State<SobreAppPage> createState() => _SobreAppPageState();
}

class _SobreAppPageState extends State<SobreAppPage> {
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
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: const Text('SOBRE O APP',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      backgroundColor: Color.fromARGB(125, 96, 24, 24),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/images/logo_cartola.png', width: 300),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Este aplicativo é destinado a entusiastas e gerentes de futebol de fantasia. "
                "Com ele, os usuários podem montar seus elencos, acompanhar a pontuação dos jogadores, "
                "e gerenciar suas equipes com facilidade. Desenvolvido para oferecer a melhor experiência "
                "em gerenciamento de times de futebol de fantasia, o app proporciona uma interface intuitiva "
                "e recursos avançados para otimizar as decisões e estratégias dos usuários.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
