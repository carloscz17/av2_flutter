import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';

class TermosEServicosPage extends StatefulWidget {
  const TermosEServicosPage({super.key});

  @override
  State<TermosEServicosPage> createState() => _TermosEServicosPageState();
}

class _TermosEServicosPageState extends State<TermosEServicosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(125, 252, 99, 34),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: const Text('TERMOS E SERVIÇOS',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      backgroundColor: Color.fromARGB(125, 96, 24, 24),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/logo_cartola.png',
                width: 300,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Termos de Uso',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ao acessar e usar este aplicativo, você aceita e concorda em estar vinculado e cumprir '
              'os Termos e Condições de Uso. Este termo é válido a partir do momento do seu primeiro uso do aplicativo. '
              'Se você não concorda em estar vinculado por este termo, então não acesse, nem use este aplicativo. ',
              textAlign: TextAlign.justify, style: TextStyle(
                color: Colors.white
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Política de Privacidade',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sua privacidade é importante para nós. É política do nosso aplicativo respeitar a sua privacidade '
              'em relação a qualquer informação sua que possamos coletar no aplicativo. Solicitamos informações pessoais '
              'apenas quando realmente precisamos delas para lhe fornecer um serviço. Fazemo-lo por meios justos e legais, '
              'com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado. ',
              textAlign: TextAlign.justify, style: TextStyle(
                color: Colors.white
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Consentimento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ao utilizar nosso aplicativo, você por este meio consente com nossos Termos e Condições e concorda com suas condições.',
              textAlign: TextAlign.justify, style: TextStyle(
                color: Colors.white
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Atualizações',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              'Os termos e condições podem ser alterados ou atualizados ocasionalmente para atender aos requisitos e padrões. '
              'Portanto, os usuários são encorajados a visitar frequentemente estas seções para se manterem atualizados sobre as mudanças no site. '
              'As modificações serão efetivas no dia de sua publicação.',
              textAlign: TextAlign.justify, style: TextStyle( color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
