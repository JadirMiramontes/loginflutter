import 'package:flutter/material.dart';
import 'package:login2024/Services/auth_services.dart';
import 'package:login2024/Services/notifications_services.dart';
import 'package:login2024/screens/LoginPage.dart';
import 'package:login2024/screens/checking_screen.dart';
import 'package:login2024/screens/principal_screen.dart';
import 'package:login2024/screens/registro_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthServices()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 247, 230, 196)),
        useMaterial3: true
      ),
      initialRoute: 'checking',
      routes: {
        'login': (_) => Loginpage(),
        'register': (_) => RegistroScreen(),
        'home': (_) => PrincipalScreen(),
        'checking': (_) => CheckingAuthScren()
      },
      scaffoldMessengerKey: NotificationsServices.messengerKey,);
      
  }
}