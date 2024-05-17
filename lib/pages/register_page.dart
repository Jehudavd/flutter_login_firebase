import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_firebase/components/my_button.dart';
import 'package:flutter_login_firebase/components/my_textfield.dart';
import 'package:flutter_login_firebase/components/square_tile.dart';

import 'package:flutter_login_firebase/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  final Function(bool)? onRegister; // Add this line

  const RegisterPage({super.key, required this.onTap, this.onRegister}); // Update the constructor

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try create the user
    try {
      // check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        // pop the loading circle
        Navigator.pop(context);

        // sign out the user immediately to prevent redirection to HomePage
        await FirebaseAuth.instance.signOut();

        // show success message
        showSuccessMessage('Registration successful, Login now!');
        // Set registering flag to false after showing success message
        widget.onRegister?.call(false);
      } else {
        // pop the loading circle before showing error message
        Navigator.pop(context);
        // show error message password don't match
        showErrorMessage('Passwords do not match!');
      }
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.message ?? 'An error occurred');
    }
  }

  // success message to user
  void showSuccessMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green[400],
            title: Center(
                child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  // Set registering flag to false after showing success message
                  widget.onRegister?.call(false);
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
                height: 25,
              ),

              // logo
              const Icon(
                Icons.account_circle_rounded,
                size: 100,
              ),

              const SizedBox(
                height: 25,
              ),

              // text welcome
              Text(
                "Hey, let's create an account for you!",
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

              // confirm password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 25,
              ),

              // sign in
              MyButton(
                text: 'Sign Up',
                onTap: signUserUp,
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

              // already have account? login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login now',
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
