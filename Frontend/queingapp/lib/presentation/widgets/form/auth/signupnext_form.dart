import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/validators_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';

class SignupnextForm extends StatefulWidget {
  final PageController controller;
  const SignupnextForm({super.key, required this.controller});

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
    final provider1 = Provider.of<ValidatorsProvider>(context);
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
            validator: (value) {
              return provider1.validatePassword(value);
            },
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
            validator: (value) {
              if (_confirmPasswordController.text != _passwordController.text) {
                return "Password doesn't match.";
              }
              return null;
            },
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
              title: provider.isLoading ? 'Loading...' : "Sign Up",
              onPressed: provider.isLoading
                  ? null
                  : () {
                      if (_key.currentState!.validate()) {
                        final data = UserEntity(
                          phone: provider.phone,
                          surname: provider.surname.trim(),
                          name: provider.name.trim(),
                          password: _confirmPasswordController.text.trim(),
                          username: _usernameController.text.trim(),
                          birthdate: provider.birthdate,
                          email: provider.email.trim(),
                          address: provider.address.trim(),
                        );

                        provider.signUpUser(context, data);
                        widget.controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
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
