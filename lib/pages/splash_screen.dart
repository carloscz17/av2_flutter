import 'package:flutter/material.dart';
import 'package:flutter_application/pages/screen_inicial.dart';

// Define um StatefulWidget para gerenciar o estado da tela de Splash
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin { // Mixin utilizado para controle de animações, se necessário

  @override
  void initState() {
    super.initState();

    // Delay de 1 segundo antes de navegar para a ScreenInicial
    Future.delayed(const Duration(seconds: 1), () {
      // Substitui a tela atual pela ScreenInicial no stack de navegação
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ScreenInicial(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color.fromARGB(125, 96, 24, 24), // Define a cor de fundo da tela
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Centraliza e distribui espaço igualmente
          children: [
            Image.asset('assets/images/logo_cartola.png',
            height: 250,
            width: 250,
            ), // Logo do aplicativo
            const Text(
                  "Seja bem-vindo ao Cartola\n aqui você tem seu aplicativo\n de pontuações do brasileirão!",
                  textAlign: TextAlign.center, // Centraliza o texto
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ) // Mensagem de boas-vindas
          ],
        ),
      ),
    ));
  }
}
