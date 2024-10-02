import 'package:flutter/material.dart';
import 'package:login2024/Services/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

class RegistroScreen extends StatelessWidget {
  RegistroScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 96, 100, 93)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: size.width * 0.80,
                height: size.height * 0.17,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  //TODO: Agregar una imagen
                ),
              ),
              Container(
                width: size.width * 0.80,
                height: size.height * 0.17,
                alignment: Alignment.center,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'ejemplo@gmail.com',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 244, 244)
                  ),
                ),
              ), const SizedBox(height: 16,),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: '**************************',
                  labelText: 'contraseña',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 244, 244)
                  ),
                ),
              ),const SizedBox(height: 16,),
              TextButton(onPressed: (){
                print('Boton iniciar sesion');
                Navigator.pushNamed(context, 'login', arguments: '');
              },
              child: const Text('¿Ya tienen una cuenta? Iniciar sesion',
                style: TextStyle(color: Color.fromARGB(255, 255, 244, 244)
                ),
               ),
              ),
            ],
          ),
          ),
        ),
    );
  }
}