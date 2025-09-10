import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/form/auth/signupnext_form.dart';
import 'package:queingapp/utils/AppPadding.dart';

class SignupNext extends StatefulWidget {
  final PageController controller;
  const SignupNext({super.key, required this.controller});

  @override
  State<SignupNext> createState() => _SignupNextState();
}

class _SignupNextState extends State<SignupNext> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(padding: AppPaddings.padding, child: SignupnextForm(controller: widget.controller,)),
        ),
      ),
    );
  }
}
