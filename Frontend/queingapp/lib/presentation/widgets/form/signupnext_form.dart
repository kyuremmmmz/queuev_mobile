import 'package:flutter/material.dart';

class SignupnextForm extends StatefulWidget {
  const SignupnextForm({super.key});

  @override
  State<SignupnextForm> createState() => _SignupnextFormState();
}

class _SignupnextFormState extends State<SignupnextForm> {
  final _key = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
            
          ],
        )
      );
  }
}