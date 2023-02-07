import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Container(
        alignment: Alignment.center,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tiktok ",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
              const SizedBox(height: 25,),
              
            ]),
      ),
    );
  }
}
