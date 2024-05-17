import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_firebase/components/my_button.dart';
import 'package:flutter_login_firebase/components/my_textfield.dart';
import 'package:flutter_login_firebase/components/square_tile.dart';
import 'package:flutter_login_firebase/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      barrierDismissible: false, // prevent dismissing by tapping outside
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.message ?? 'An error occurred');
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[400],
            title: Center(
                child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false, //solve bottom overloaded
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 50,
              ),

              // logo
              const Icon(
                Icons.account_circle_rounded,
                size: 100,
              ),

              const SizedBox(
                height: 50,
              ),

              // text welcome
              Text(
                "Welcome back, people pleaser!",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 20,
              ),

              // sign in
              MyButton(
                text: 'Sign In',
                onTap: signUserIn,
              ),

              const SizedBox(
                height: 50,
              ),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // google sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: AuthService().signInWithGoogle,
                      child: SquareTile(imagePath: 'lib/images/google.png')),
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              // dont have account? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
