import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';


// Your existing imports
import 'splashscreen.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets binding is ready before async calls
  await Firebase.initializeApp(); // Initialize Firebase
  await FirebaseAppCheck.instance.activate(androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TajwidKidz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreenWidget(),
    );
  }
}
