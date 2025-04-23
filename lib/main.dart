import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // O widget principal que configura o aplicativo.
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor primária do tema.
      ),
      home: LoginPage(), // Define a página inicial como a tela de login.
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para os campos de texto (e-mail e senha).
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Método para realizar o login (pode ser substituído por lógica real).
  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Verifica se os campos estão preenchidos.
    if (email.isNotEmpty && password.isNotEmpty) {
      // Aqui você pode adicionar a lógica de autenticação, como chamadas à API.
      print('E-mail: $email, Senha: $password');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login realizado com sucesso!')),
      );
    } else {
      // Exibe uma mensagem de erro se algum campo estiver vazio.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Login'), // Título da barra superior.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adiciona espaçamento nas bordas.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente.
          children: [
            TextField(
              controller: _emailController, // Controlador para o campo de e-mail.
              decoration: InputDecoration(
                labelText: 'E-mail', // Rótulo do campo.
                border: OutlineInputBorder(), // Estilo da borda.
              ),
              keyboardType: TextInputType.emailAddress, // Define o teclado para e-mail.
            ),
            SizedBox(height: 16), // Espaçamento entre os campos.
            TextField(
              controller: _passwordController, // Controlador para o campo de senha.
              decoration: InputDecoration(
                labelText: 'Senha', // Rótulo do campo.
                border: OutlineInputBorder(), // Estilo da borda.
              ),
              obscureText: true, // Oculta o texto digitado (senha).
            ),
            SizedBox(height: 24), // Espaçamento antes do botão.
            ElevatedButton(
              onPressed: _login, // Chama o método de login ao pressionar o botão.
              child: Text('Entrar'), // Texto do botão.
            ),
            SizedBox(height: 16), // Espaçamento antes do link de registro.
            TextButton(
              onPressed: () {
                // Aqui você pode navegar para a tela de registro.
                print('Redirecionando para a tela de registro...');
              },
              child: Text('Não tem uma conta? Registre-se aqui.'), // Texto do link.
            ),
          ],
        ),
      ),
    );
  }
}