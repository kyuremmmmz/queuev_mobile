import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/form/signup_form.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: AppPaddings.padding,
            child: Column(
            children: [
              SignupForm()
            ],
          ),
          )
        ),
      )
    );
  }
}