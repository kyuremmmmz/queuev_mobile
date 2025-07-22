import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';
import 'package:queingapp/presentation/screens/auth/auth_wrapper.dart';
import 'package:queingapp/presentation/screens/home/home_screen.dart';
import 'package:queingapp/presentation/screens/home/scan_now_screen.dart';


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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(child: Text('Error reading token')),
          );
        } else {
          final token = snapshot.data;
          if (token!=null) {
            return const ScanNowScreen();
          } else {
            return const AuthWrapper();
          }
        }
      },
    );
  }
}