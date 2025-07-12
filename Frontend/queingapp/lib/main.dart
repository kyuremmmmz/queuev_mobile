import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/screens/auth/auth_wrapper.dart';
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
      ChangeNotifierProvider(create: (_) =>  di.sl<AuthProvider>())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: AuthWrapper(),
      )
    );
  }
}