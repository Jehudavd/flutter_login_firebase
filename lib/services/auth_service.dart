import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthService {
  // google sign in
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // begin sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      // create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // sign in
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // show success dialog with UID
      showSuccessDialog(context, userCredential.user?.uid);
    } catch (e) {
      // handle error
      showErrorMessage(context, e.toString());
    }
  }

  // success message to user
  void showSuccessDialog(BuildContext context, String? uid) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Login Successful!"),
          content: Text("Your user ID is: $uid"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // error message to user
  void showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login Failed!'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            )
          ],
        );
      },
    );
  }
}
