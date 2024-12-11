import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ts_613_firebase/firebase_options.dart';
import 'package:ts_613_firebase/login_screen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,

);
runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}
 