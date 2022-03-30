import 'package:abhicreativefashion/Ui/Home/FirstScreen.dart';
import 'package:abhicreativefashion/Ui/Home/SecondScreen.dart';
import 'package:abhicreativefashion/Ui/Login/LoginScreen.dart';
import 'package:abhicreativefashion/Ui/Login/RegisterScreen.dart';
import 'package:abhicreativefashion/Ui/Splash/Splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash_Screen(),
        '/LoginScreenRoute': (context) => const LoginScreen(),
        '/RegisterScreenRoute': (context) => const RegisterScreen(),
        '/FirstScreenRoute': (context) => const FirstScreen(),
        '/SecondScreenRoute': (context) => const SecondScreen(),
      },
    ),
  );
}

