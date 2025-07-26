import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/form/auth/signup_form.dart';
import 'package:queingapp/utils/AppPadding.dart';

class Signup extends StatefulWidget {
  final PageController controller;
  const Signup({super.key, required this.controller});

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
              SignupForm(
                controller: widget.controller,
              )
            ],
          ),
          )
        ),
      )
    );
  }
}