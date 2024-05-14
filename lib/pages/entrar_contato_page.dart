import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';

// StatefulWidget para permitir a atualização da UI com interação do usuário
class EntrarEmContatoPage extends StatefulWidget {
  const EntrarEmContatoPage({super.key});

  @override
  State<EntrarEmContatoPage> createState() => _EntrarEmContatoPageState();
}

class _EntrarEmContatoPageState extends State<EntrarEmContatoPage> {
  // Define controladores de texto para campos de formulário
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mensagemController = TextEditingController();

  // Função para enviar o formulário
  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) { // Verifica se o formulário está válido
      _formKey.currentState!.save();
      // Mostra um diálogo de confirmação
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Mensagem Enviada"),
            content: const Text("Sua mensagem foi enviada com sucesso!"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o diálogo
                  _nomeController.clear(); // Limpa os campos do formulário
                  _emailController.clear();
                  _mensagemController.clear();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(125, 252, 99, 34),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: const Text('ENTRAR EM CONTATO', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color.fromARGB(125, 96, 24, 24),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Center(child: Image.asset('assets/images/logo_cartola.png', width: 300)),
              // Campo de texto para nome
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              // Campo de texto para email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
              ),
              // Campo de texto para mensagem
              TextFormField(
                controller: _mensagemController,
                decoration: const InputDecoration(
                  labelText: 'Mensagem',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma mensagem';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Botão para enviar formulário
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                      color: Color.fromARGB(125, 252, 99, 34),
                    )
                  ),
                  onPressed: _enviarFormulario,
                  child: const Text('Enviar', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpa os controladores quando a página é descartada
    _nomeController.dispose();
    _emailController.dispose();
    _mensagemController.dispose();
    super.dispose();
  }
}
