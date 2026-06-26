import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../screens/home_screen.dart';
import '../screens/register_screen.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> 
    with SingleTickerProviderStateMixin {
  final loginScreen = TextEditingController(); //editCntroller é para gerir a variável 
  final senhaScreen = TextEditingController();

  UserModel? usuarioCadastrado;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState(){ //Iniciar animação na caixa de texto (input)
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      );

      _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

      _controller.forward();
  }

  @override
  void dispose(){ //Finalizar animação na caixa de texto (input)
    loginScreen.dispose();
    senhaScreen.dispose();
    _controller.dispose();
    super.dispose();
  }
  
  void fazerLogin(){
    if (usuarioCadastrado == null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nenhum usuário encontrado")),
      );
    }
    if (loginScreen.text == usuarioCadastrado!.login &&
        senhaScreen.text == usuarioCadastrado!.senha){ //Serve para verificar se há cadastro
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(nome: usuarioCadastrado!.nome),
        ),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Inválido")),
      );
    }
  }

  Future<void> abrirCadastro() async{
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RegisterScreen()),
    );

    if (resultado != null && resultado is UserModel){
      setState(() {
        usuarioCadastrado = resultado;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(Icons.lock, size: 80, color: Colors.blue),

              const SizedBox(height: 20),

              TextField(
                controller: loginScreen,
                decoration: const InputDecoration(
                  labelText: "Login",
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: senhaScreen,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: fazerLogin,
                child: const Text("Entrar"),
              ),

              TextButton(
                onPressed: abrirCadastro,
                child: const Text("Criar novo perfil"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}