import 'package:flutter/material.dart';
import 'package:login2024/Services/auth_services.dart';
import 'package:login2024/screens/login_screen.dart';
import 'package:login2024/screens/principal_screen.dart';
import 'package:provider/provider.dart';

class CheckingAuthScren extends StatelessWidget{
  const CheckingAuthScren({super.key});

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authServices.readToken(), 
          builder: (BuildContext context, AsyncSnapshot<String> snapshot){
            if(!snapshot.hasData) return Text('');
            if(snapshot.hasData != ''){
              Future.microtask((){
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ____) => Loginpage(),
                    transitionDuration: Duration(seconds: 0)
                    )
                );
              });
            }else{
              Future.microtask((){
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(pageBuilder:(_,__,___) => PrincipalScreen(),
                  transitionDuration: Duration(seconds: 0))
                  );
              });
            }
            return Container();
          }
        ),
      ),
    );
  }
}