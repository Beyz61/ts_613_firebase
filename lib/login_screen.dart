import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "E-Mail",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                prefixIcon: const Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: "Passwort",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                prefixIcon: const Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Login", style: TextStyle(color: Colors.black),),
            ),
             const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Logout", style: TextStyle(color: Colors.red),),
            ),
          ],
        ),
      ),
    );
  }
}
