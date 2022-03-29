// import 'package:abhicreativefashion/Core/Routes/Routes.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       getPages: Routes.getAllScreen(),
//     );
//   }
// }
//
//
//
import 'package:abhicreativefashion/Ui/Home/FirstScreen.dart';
import 'package:abhicreativefashion/Ui/Home/SecondScreen.dart';
import 'package:abhicreativefashion/Ui/Screen/HomeScreen.dart';
import 'package:abhicreativefashion/Ui/Screen/PickupScreen.dart';
import 'package:abhicreativefashion/Ui/Screen/ProfileScreen.dart';
import 'package:abhicreativefashion/Ui/Screen/ReturnScreen.dart';
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
        // '/': (context) => Splash_Screen(),
        // '/LoginScreenRoute': (context) => LoginScreen(),
        // '/RegisterScreenRoute': (context) => RegisterScreen(),
        '/': (context) => FirstScreen(),
        '/SecondScreenRoute': (context) => SecondScreen(),
      },
    ),
  );
}

