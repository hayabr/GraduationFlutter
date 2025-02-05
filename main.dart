import 'package:flutter/material.dart';

import 'package:userauth/app/auth/login.dart';
import 'package:userauth/app/auth/signup.dart';
import 'package:userauth/app/auth/success.dart';
import 'package:userauth/app/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PHP Material App',
      initialRoute: "login", // ✅ Ensure correct case
      routes: {
        "login": (context) => const Login(),
        "signup": (context) => const Signup(),
        "home": (context) => const Home(),
        "success": (context) => const Success(),
        
      },
    );
  }
}
