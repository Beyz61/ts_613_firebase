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
Future<void> loginUser(String email, String password) async {
    try {
      final userCredential = await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(" Du bist eingeloggt: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Exception: ${e.message}");
    } catch (e) {
      print("Allgemeiner Fehler: $e");
    }
    
  }
  Future<void> logoutUser() async {
    try {
      await authInstance.signOut();
      print("Du bist ausgeloggt");
    } catch (e) {
      print("Fehler beim Logout: $e");
    }
  }

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
                String email = emailController.text;
                String password = passwordController.text;
                loginUser(email, password);
               
              },
              child: const Text("Login", 
              style: TextStyle(
                color: Colors.black),),
            ),
             const SizedBox(height: 32),
            ElevatedButton(
              onPressed: ()  {
            logoutUser();
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
