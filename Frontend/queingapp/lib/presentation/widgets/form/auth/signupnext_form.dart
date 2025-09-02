import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';

class SignupnextForm extends StatefulWidget {
  const SignupnextForm({super.key});

  @override
  State<SignupnextForm> createState() => _SignupnextFormState();
}

class _SignupnextFormState extends State<SignupnextForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();

  final _key = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),
          const Text("CREATE USERNAME"),
          const SizedBox(height: 10),
          ReusableField(controller: _usernameController),
          const SizedBox(height: 30),
          const Text("CREATE PASSWORD"),
          const SizedBox(height: 10),
          ReusableField(
            controller: _passwordController,
            isObscure: isObscure,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          const SizedBox(height: 30),
          const Text("CONFIRM PASSWORD"),
          const SizedBox(height: 10),
          ReusableField(
            controller: _confirmPasswordController,
            isObscure: isObscure,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          const SizedBox(height: 120),
          Center(
            child: ReusableButton(
              title: "Sign Up",
              onPressed: () {
                if (_key.currentState!.validate()) {
                  final data = UserEntity(
                    phone: provider.phone,
                    surname: provider.surname.trim(),
                    name: provider.name.trim(),
                    password: _confirmPasswordController.text.trim(),
                    username: _usernameController.text.trim(),
                    birthdate: provider.birthdate,
                    email: provider.email.trim(),
                    address: provider.address.trim()
                  );
                  provider.signUpUser(data);
                }
              },
              width: 200,
              height: 50,
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
