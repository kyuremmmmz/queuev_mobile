import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/presentation/screens/auth/login/login.dart';
import 'package:queingapp/presentation/screens/home/scan_now_screen.dart';


class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: USER.idTokenChanges(),
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
          final user = snapshot.data;
          if (user != null) {
            if (user.emailVerified) {
              return const ScanNowScreen();
            } else {
              return const LoginScreen();
            }
          } else {
            return const LoginScreen();
          }
        }
      },
    );
  }
}
