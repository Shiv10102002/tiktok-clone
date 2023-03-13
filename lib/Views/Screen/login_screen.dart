import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok/Views/Screen/sinup_screen.dart';
import 'package:tictok/Views/Widgets/textinput_field.dart';
import 'package:tictok/controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

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
            const Text(
              "Tiktok ",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w900),
            ),
            /*
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),*/
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextinputField(
                controller: _emailController,
                myLabelText: "Email",
                myIcon: Icons.email,
                ishide: false,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextinputField(
                controller: _passController,
                myLabelText: "Password",
                myIcon: Icons.lock,
                ishide: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                AuthController.instance
                    .login(_emailController.text, _passController.text);
              },
              child: const Text("Login"),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("if you don't have an account "),
                InkWell(
                  onTap: () => Get.to(() => SinupScreen()),
                  child: const Text(
                    "Sin_up",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
