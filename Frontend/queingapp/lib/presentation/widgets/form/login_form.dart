import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/domain/entities/Auth/login_entity.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/checkboxes/checkboxes.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final storageprovider = Provider.of<StorageProvider>(context);
    return Form(
      key: key,
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
            controller: _passwordController,
            ),
          const SizedBox(
            height: 120,
          ),
          Center(
            child: ReusableButton(
            title:provider.isLoading ? "Loading..." :"LOG IN",
            width: 200.0,
            height: 50.0,
            textColor: Colors.white,
            backgroundColor: Colors.black,
            onPressed: provider.isLoading
                    ? null
                    : () async {
                        if (key.currentState!.validate()) {
                          final entity = LoginEntity(
                            username: _userNameController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                          await provider.loginUser(entity);
                        }
                      },
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