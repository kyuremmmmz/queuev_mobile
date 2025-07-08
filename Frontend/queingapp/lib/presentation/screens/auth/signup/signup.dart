import 'package:flutter/material.dart';
import 'package:queingapp/utils/AppPadding.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.padding,
          child: Text('Sign Up'),
          )
        ),
    );
  }
}