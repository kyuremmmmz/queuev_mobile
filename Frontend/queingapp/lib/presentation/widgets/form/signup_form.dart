import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/checkboxes/checkboxes.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _userNameController = TextEditingController();
  bool isChecked = false;
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
          const Text("NAME"),
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
          const Text("SURNAME"),
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
            height: 120,
          ),
          Center(
            child: ReusableButton(
            title: "NEXT",
            width: 200.0,
            height: 50.0,
            textColor: Colors.white,
            backgroundColor: Colors.black,
            onPressed: isChecked
                ? () {
                    // TODO: Implement login logic here
                  }
                : null,
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          Center(
            child: Checkboxes(isChecked: isChecked,
            onChanged: (value){
                setState(() {
                  isChecked = value!;
                });
              },
            ),
          )
        ],
      ),
      )
    );
  }
}