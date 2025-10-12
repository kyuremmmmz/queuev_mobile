import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/domain/entities/Auth/login_entity.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/validators_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
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
    final provider1 = Provider.of<ValidatorsProvider>(context);
    return Form(
      key: key,
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("USERNAME"),
          const SizedBox(
            height: 10,
          ),
          ReusableField(
            controller: _userNameController,
            validator: (value){
              return provider1.validateAll(value, 'username');
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
            isObscure: provider.isObscure,
            suffixIcon: IconButton(onPressed: provider.toggleEye, icon: Icon(provider.isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined)),
            validator: (value){
              return provider1.validateAll(value, 'password');
            }, 
            controller: _passwordController,
            ),
          const SizedBox(
            height: 10,
          ),
          ReusableButton(
            title:provider.isLoading ? "Loading..." :"LOG IN",
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            textColor: Colors.white,
            backgroundColor: Colors.black,
            onPressed:  provider.isLoading
                    ? null
                    : () async {
                        if (key.currentState!.validate()) {
                          final entity = LoginEntity(
                            username: _userNameController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                          await provider.loginUser(context,entity);
                          final stacks = Navigator.canPop(context);
                          if (stacks == true) {
                            Navigator.pop(context);
                          }
                        }
                      },
            ),
          const SizedBox(height: 20,),
          Center(
            child: GestureDetector(
            child: Text('FORGOT PASSWORD?',
            textAlign: TextAlign.center,
            
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.underline
            ),
            ),
            onTap: (){},
          ),
          ),
          const SizedBox(
            height: 130,
          ),
        ReusableButton(
          title: 'CREATE NEW ACCOUNT', 
          onPressed: (){
            Navigator.pushNamed(context, '/signup');
          }, 
          width: MediaQuery.of(context).size.width, 
          height: 50, 
          textColor: Colors.black,
          backgroundColor: Colors.white,
          borderColor: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      )
    );
  }
}