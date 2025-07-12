import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';
import 'package:queingapp/injection.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/screens/auth/signup/signup_next.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/checkboxes/checkboxes.dart';
import 'package:queingapp/presentation/widgets/form/signupnext_form.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';
import 'package:queingapp/utils/Validators.dart';

class SignupForm extends StatefulWidget {
  final PageController controller;
  const SignupForm({super.key, required this.controller});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  
  final _surnameController = TextEditingController();
  final _nameController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  void dispose() {
    _surnameController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text("CREATE NAME"),
          const SizedBox(
            height: 10,
          ),
          ReusableField(
            controller: _nameController,
            validator: (value){
              if (value!.isEmpty) {
                return "Please enter your name.";
              }
              return null;
            }, 
            ),
            const SizedBox(
            height: 30,
          ),
          const Text("CREATE SURNAME"),
          const SizedBox(
            height: 10,
          ),
          ReusableField(
            hintText: "Ex: Johndoe_19!",
            validator: (value){
              if (value!.isEmpty) {
                print("test");
                return "Please enter username";
              }
              else if(Validators.usernameRegex.hasMatch(value)){
                return "Invalid username. Must start with a letter, use letters, numbers, _, or !, and be 3–20 characters.";
              }
              return null;
            }, 
            controller: _surnameController,
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
                    if (_key.currentState!.validate()) {
                        provider.signUserData(_nameController.text.trim(), _surnameController.text.trim());
                        widget.controller.nextPage(
                          duration: const Duration(
                          milliseconds: 300
                        ), curve: Curves.ease);
                    }
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