import 'package:flutter/material.dart';
import 'package:flutter_application/pages/criar_conta_page.dart';
import 'package:flutter_application/pages/login_page.dart';

class ScreenInicial extends StatefulWidget {
  const ScreenInicial({super.key});

  @override
  State<ScreenInicial> createState() => _ScreenInicialState();
}

class _ScreenInicialState extends State<ScreenInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(125, 96, 24, 24),
        body: Stack(children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 250),
                        child: Image.asset(
                          'assets/images/logo_cartola.png',
                          width: 300,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(125, 252, 99, 34),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: const Text('FAZER LOGIN',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(125, 252, 99, 34),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CriarContaPage()));
                              },
                              child: const Text('CRIAR CONTA',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ))
        ]));
  }
}
