import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/form/auth/signupnext_form.dart';
import 'package:queingapp/utils/AppPadding.dart';

class SignupNext extends StatefulWidget {
  const SignupNext({super.key});

  @override
  State<SignupNext> createState() => _SignupNextState();
}

class _SignupNextState extends State<SignupNext> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: AppPaddings.padding,
          child: SignupnextForm(),
        )
      ),
    ),
    );
  }
}