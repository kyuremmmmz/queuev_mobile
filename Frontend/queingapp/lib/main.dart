
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/validators_provider.dart';
import 'package:queingapp/presentation/provider/FormProviders/qeue_provider.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';
import 'package:queingapp/presentation/screens/auth_checker.dart';
import 'package:queingapp/presentation/screens/home/home_screen.dart';
import 'package:queingapp/presentation/screens/home/qeue_reservation_screen.dart';


import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) =>  di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (_) => di.sl<ValidatorsProvider>()),
      ChangeNotifierProvider(create: (_) => di.sl<StorageProvider>()),
      ChangeNotifierProvider(create: (_) => di.sl<QrViewProvider>()),
      ChangeNotifierProvider(create: (_) => di.sl<QeueProvider>()),
    ],
    child: MaterialApp(
      routes:  {
        '/home': (context) => const HomeScreen(),
        '/qeue': (context) => const QeueReservationScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const AuthChecker(),
      ),
    );
  }
}