import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/screen_inicial.dart';

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
        backgroundColor: Color.fromARGB(125, 252, 99, 34),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,
          ),
          onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScreenInicial()));
            },
        ),
        title: const Text('LOGIN',
        style: TextStyle(
          color: Colors.white
        ),),
        ),
      backgroundColor: const Color.fromARGB(125, 96, 24, 24),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset('assets/images/logo_cartola.png',
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
                            color: 
                                  Colors.white)
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
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  'Senha'),
                border: OutlineInputBorder(
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(125, 252, 99, 34),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Text('ENTRAR',
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
