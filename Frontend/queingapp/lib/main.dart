import 'package:flutter/material.dart';
import 'package:queingapp/presentation/screens/auth/auth_wrapper.dart';
import 'package:queingapp/presentation/screens/auth/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: AuthWrapper(),
    );
  }
}