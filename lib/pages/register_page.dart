import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //Sign Up method
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password do not match!'),
        ),
      );
      return;
    }
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text(e.toString()),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      //backgroundColor: const Color.fromARGB(255, 161, 24, 24),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo
                const Icon(
                  Icons.message,
                  size: 80,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                const SizedBox(
                  height: 50,
                ),
                //Create Account message
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //email
                MyTextField(
                  controller: emailController,
                  hintText: "Enter your Email",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: "Enter Password",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                //Confirm Password
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),

                //sign Up button
                MyButton(onTap: signUp, text: "Sign Up"),

                const SizedBox(
                  height: 25,
                ),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a member?",style: TextStyle(color: Colors.white),),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: widget.onTap,
                      child: const Text(
                        "Login now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
