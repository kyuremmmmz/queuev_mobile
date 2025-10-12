import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/form/auth/login_form.dart';
import 'package:queingapp/utils/AppPadding.dart';
import 'package:queingapp/utils/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
        child: Padding(
          padding: AppPaddings.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(logo,
              height: 300,
              width: 300,
              ),
              ),
              LoginForm()
            ],
          )
        )
      ),
      )
    );
  }
}