import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userNameController = TextEditingController();
  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text("USERNAME"),
          const SizedBox(
            height: 10,
          ),
          ReusableField(
            controller: _userNameController,
            validator: (value){
              return null;
            }, 
            ),
            const SizedBox(
            height: 30,
          ),
          const Text("PASSWORD"),
          const SizedBox(
            height: 10,
          ),
          ReusableField(
            validator: (value){
              return null;
            }, 
            controller: _userNameController,
            ),
          const SizedBox(
            height: 170,
          ),
          Center(
            child: ReusableButton(
            title: "LOG IN",
            width: 200.0,
            height: 50.0,
            textColor: Colors.white,
            backgroundColor: Colors.black,
            onPressed: (){}),
          )
        ],
      ),
      )
    );
  }
}