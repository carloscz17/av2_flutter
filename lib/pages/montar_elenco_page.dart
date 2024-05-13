import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';

class MontarElencoPage extends StatefulWidget {
  const MontarElencoPage({super.key});

  @override
  State<MontarElencoPage> createState() => _MontarElencoPageState();
}

class _MontarElencoPageState extends State<MontarElencoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(125, 252, 99, 34),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,
          ),
          onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
        ),
        title: Text('MONTAR ELENCO'),
        ),
        backgroundColor: Color.fromARGB(125, 96, 24, 24),
      body: Center(
        child: 
        Image.asset('assets/images/campo_verde.png',
        height: 300,
        width: 300,),
      )
    );
  }
}