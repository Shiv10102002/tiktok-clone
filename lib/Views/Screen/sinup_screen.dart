import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok/Views/Screen/login_screen.dart';
import 'package:tictok/Views/Widgets/textinput_field.dart';
import 'package:tictok/controller/auth_controller.dart';
import 'dart:io';

class SinupScreen extends StatelessWidget {
  SinupScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _setpassController = TextEditingController();
  final TextEditingController _confpassController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome To Tiktok ",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w900),
              ),
              /*
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
              */
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  AuthController.instance.pickImage();
                },
                child: Stack(
                  children: const [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.pphfoundation.ca/wp-content/uploads/2018/05/default-avatar.png"),
                      radius: 60,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(Icons.photo_camera_outlined),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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
                  controller: _usernameController,
                  myLabelText: "User name",
                  myIcon: Icons.person,
                  ishide: false,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextinputField(
                  controller: _setpassController,
                  myLabelText: "Set password",
                  myIcon: Icons.lock,
                  ishide: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextinputField(
                  controller: _confpassController,
                  myLabelText: "Confirm password",
                  myIcon: Icons.lock,
                  ishide: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  AuthController.instance.signUp(
                      _usernameController.text,
                      _emailController.text,
                      _confpassController.text,
                      AuthController.instance.profImg);
                },
                child: const Text("Sign Up"),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("if you have already an account "),
                  InkWell(
                    onTap: () => Get.to(
                      () => LoginScreen(),
                    ),
                    child: const Text(
                      "Log_in",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
