import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/form/auth/sign_up_personal_info.dart';
import 'package:queingapp/presentation/widgets/form/auth/signup_form.dart';
import 'package:queingapp/utils/AppPadding.dart';

class SignupPersonalInfoScreen extends StatefulWidget {
  final PageController controller;
  const SignupPersonalInfoScreen({super.key, required this.controller});

  @override
  State<SignupPersonalInfoScreen> createState() => _SignupPersonalInfoScreenState();
}

class _SignupPersonalInfoScreenState extends State<SignupPersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: AppPaddings.padding,
            child: Column(
            children: [
              SignUpPersonalInfo(
                pageController: widget.controller,
              )
            ],
          ),
          )
        ),
      )
    );
  }
}