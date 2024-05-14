import 'package:flutter/material.dart';
import 'package:flutter_application/pages/screen_inicial.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
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
    return  SafeArea(child: Scaffold(
      backgroundColor: Color.fromARGB(125, 96, 24, 24),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/logo_cartola.png',
            height: 250,
            width: 250,
            ),
            const Text(
                  "Seja bem-vindo ao Cartola\n aqui você tem seu aplicativo\n de pontuações do brasileirão!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],),
      ),
    ));
  }
}
