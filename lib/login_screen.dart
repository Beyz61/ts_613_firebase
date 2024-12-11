import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final authInstance = FirebaseAuth.instance;

Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

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
              controller: emailController,
              decoration: InputDecoration(
                labelText: "E-Mail",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                prefixIcon: const Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Passwort",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                prefixIcon:  const Icon(Icons.lock),
              ),
              obscureText: true,
            ),
             const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async { 
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                try {
                  await authInstance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Du bist eingeloggt")),
                  );
                }
              },
              child: const Text("Login", 
              style: TextStyle(
                color: Colors.black),),
            ),
             const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                await authInstance.signOut();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Du bist ausgeloggt")),
                );
              },
              child: const Text("Logout", 
              style: TextStyle(color: Colors.red),),
            ),
          ],
        ),
      ),
    );
  }
}
