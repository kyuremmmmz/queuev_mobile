import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/form/auth/change_password_form.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 15, right: 15, bottom: 20),
        child: ChangePasswordForm(),
        )
    );
  }
}