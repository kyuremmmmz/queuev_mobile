import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/appbar/auth_app_bar.dart';
import 'package:queingapp/utils/AppPadding.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.padding,
          child: Column(
            children: [
              
            ],
          )
        )
      )
    );
  }
}