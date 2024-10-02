import 'package:flutter/material.dart';
import 'package:login2024/Services/auth_services.dart';
import 'package:login2024/Services/notifications_services.dart';
import 'package:login2024/Services/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatelessWidget{
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ChangeNotifierProvider(
          create: (_) => LoginFormProvider(),
          child: _LoginForm(),
          ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginform = Provider.of<LoginFormProvider>(context);
    return Center(
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 96, 108, 93)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16,),
                Container(
                  width: size.width * 0.80,
                  height: size.height * 0.17,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    //Todo: poner imagen
                    //Image: DecorationImage(image:...)
                  ),
                ),
                Container(
                  width: size.width * 0.80,
                  height: size.height * 0.05,
                  alignment: Alignment.center,
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  controller:  _emailController,
                  decoration: const InputDecoration(
                    hintText: 'ejemplo@text.com',
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 244, 244)
                    ),
                  ),
                  validator: (value){
                    String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no es un correo';
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: '*****',
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 244)
                    ),
                  ),
                  validator: (value){
                    return (value != null && value.length >=8)
                    ? null
                    : 'La contrase;a debe ser mayor a 7 caracteres';
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text('¿Olvide mi contarseña?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 254),
                  ),
                  ),
                ),
                ElevatedButton(
                  onPressed: loginform.isLoading
                  ? null
                  : () async {
                    final authService = Provider.of<AuthServices>(
                      context,
                      listen: false
                    );
                    if(!loginform.isValidForm())return;

                    final String? errorMessage = await authService.login(loginform.email, loginform.password);
                    if(errorMessage == null){
                      Navigator.pushReplacementNamed(context, 'home');
                    }else{
                      NotificationsServices.showSnackbar(errorMessage);
                      loginform.isLoading = false;
                    }
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255,255,244,244))),
                  child: const Text(
                    'Iniciar Sesion',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 96, 100, 93)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 255, 244, 244),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, 'register',
                    arguments: '');
                  }, 
                  child: const Text(
                    'Registrate',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 96, 108, 93),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}