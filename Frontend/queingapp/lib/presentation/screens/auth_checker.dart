import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';
import 'package:queingapp/presentation/screens/auth/login/login.dart';
import 'package:queingapp/presentation/screens/home/home_screen.dart';


class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StorageProvider>(context, listen: true);

    return StreamBuilder<String?>(
      stream: provider.readSecureToken(),
      builder: (context, snapshot) {
        debugPrint('StreamBuilder snapshot: $snapshot');
        if (snapshot.connectionState == ConnectionState.waiting) {
          debugPrint('StreamBuilder: Waiting for token');
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          debugPrint('StreamBuilder error: ${snapshot.error}');
          return const Scaffold(
            body: Center(child: Text('Error reading token')),
          );
        } else {
          final token = snapshot.data;
          debugPrint('StreamBuilder token: $token');
          if (token!=null) {
            debugPrint('Showing LoginScreen'); 
            return const HomeScreen();
          } else {
            debugPrint('Showing HomeScreen');
            return const LoginScreen();
          }
        }
      },
    );
  }
}