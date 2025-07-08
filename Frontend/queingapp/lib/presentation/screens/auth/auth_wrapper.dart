import 'package:flutter/material.dart';
import 'package:queingapp/presentation/screens/auth/login/login.dart';
import 'package:queingapp/presentation/screens/auth/signup/signup.dart';
import 'package:queingapp/presentation/widgets/appbar/auth_app_bar.dart';
import 'package:queingapp/presentation/widgets/navigations/tab_bar.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return TabBarComponent(
      screen: Scaffold(
        appBar: AuthAppBar(),
        body: TabBarView(
          children: [
          LoginScreen(),
          Signup()
        ]),
      )
    );
  }
}