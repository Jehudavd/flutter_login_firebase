import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello! " + user.email!,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            Text(
              "Your UID: " + user.uid,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
