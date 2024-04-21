import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ChatApp'),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: Center(
          child: Text('Logged In'),
        ));
  }
}
