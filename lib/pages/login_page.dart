import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_text_field.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                //Welcome back message
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
                // const SizedBox(
                //   height: 10,
                // ),
                // //Forgot password
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 15.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         "Forgot password?",
                //         style: TextStyle(color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 25,
                ),
                //sign in button
                MyButton(onTap: signIn, text: "Sign In"),

                const SizedBox(
                  height: 25,
                ),
                
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?",style: TextStyle(color: Colors.white),),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: widget.onTap,
                      child: const Text(
                        "Register now", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
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
