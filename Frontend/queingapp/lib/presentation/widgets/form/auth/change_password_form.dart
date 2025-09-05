import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/change_account_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/validators_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangeAccountProvider>(context);
    final provider2 = Provider.of<AuthProvider>(context);
    final provider1 = Provider.of<ValidatorsProvider>(context);
    return Form(
      key: _form,
      child: Column(
        children: [
          ReusableField(
            controller: provider.currentPasswordController,
            validator: (value) {
              return provider1.validateWithRegex(value, 'password');
            },
            hintText: 'Enter your Current password',
            isObscure: provider.isObscure,
            suffixIcon: IconButton(onPressed: (){
              provider.togglePasswordVisibility();
            }, icon: Icon(provider.isObscure ? Icons.visibility : Icons.visibility_off)),
            ),
          const SizedBox(height: 12,),
          ReusableField(
            validator: (value){
              return provider1.validateWithRegex(value, 'password');
            },
            controller: provider.passwordController, 
            hintText: 'Enter your New Password',
            isObscure: provider.isObscure,
            ),
          const SizedBox(height: 12,),
          ReusableField(
            validator: (value){
              if (value != provider.passwordController.text) {
                return 'Password do not match';
              }
              return null;
            },
            controller: provider.confirmPasswordController, 
            hintText: 'Confirm your Password',

            isObscure: provider.isObscure,
            ),
          const SizedBox(height: 20,),
          ReusableButton(title: 'Save', onPressed: (){
            if (_form.currentState!.validate()) {
              provider.changePassword(context);
            }
          }, width: 150, height: 50, backgroundColor: Colors.black, textColor: Colors.white, )
        ],
      ),
    );
  }
}