import 'package:flutter/material.dart';
import 'package:queingapp/presentation/screens/auth/signup/signup.dart';
import 'package:queingapp/presentation/screens/auth/signup/signup_next.dart';
import 'package:queingapp/presentation/screens/auth/signup/signup_personal_info_screen.dart';
import 'package:queingapp/presentation/widgets/form/auth/sign_up_personal_info.dart';

class SignupPageView extends StatefulWidget {
  const SignupPageView({super.key});

  @override
  State<SignupPageView> createState() => _SignupPageViewState();
}

class _SignupPageViewState extends State<SignupPageView> {
  final _controller = PageController();
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        Signup(
          controller: _controller,
        ),
        SignupPersonalInfoScreen(controller: _controller,),
        const SignupNext()
      ],
    );
  }
}