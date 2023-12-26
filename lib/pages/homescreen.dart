import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authication/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOUT() async {
    await Auth().signOUT();
  }

  Widget _title() {
    return const Text("Firebase Auth");
  }

  Widget _userID() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOUT,
      child: const Text("Sign Out"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userID(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
