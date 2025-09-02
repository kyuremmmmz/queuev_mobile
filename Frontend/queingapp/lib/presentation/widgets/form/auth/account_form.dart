import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/change_account_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/validators_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/inputs/input_field_custom.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({super.key});

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangeAccountProvider>(context);
    final validator = Provider.of<ValidatorsProvider>(context);
    return Form(
      key: _key,
      child: Column(
        children: [
          InputFieldCustom(
            validator: (value) {
              return validator.validateAll(value, 'Name');
            },
            label: 'NAME',
            controller: provider.nameController,
            type: TextInputType.text,
          ),
          const SizedBox(height: 20),
          InputFieldCustom(
            validator: (value) {
              return validator.validateAll(value, 'Username');
            },
            label: 'USERNAME',
            controller: provider.userNameController,
            type: TextInputType.text,
          ),
          const SizedBox(height: 20),
          InputFieldCustom(
            validator: (value) {
              return validator.validateAll(value, 'Birthday');
            },
            label: 'BIRTHDAY',
            controller: provider.birthdayController,
            type: TextInputType.text,
          ),
          const SizedBox(height: 20),
          InputFieldCustom(
            validator: (value) {
              return validator.validateAll(value, 'Address');
            },
            label: 'ADDRESS',
            controller: provider.addressController,
            type: TextInputType.text,
          ),
          const SizedBox(height: 20),
          InputFieldCustom(
            validator: (value) {
              return validator.validateAll(value, 'Phone Number');
            },
            label: 'PHONE NUMBER',
            controller: provider.phoneNumberController,
            type: TextInputType.phone, 
          ),
          const SizedBox(height: 50),
          ReusableButton(
            title: 'DONE',
            onPressed: () {
              if (_key.currentState!.validate()) {
                provider.updateProfile(
                );
   
              }
            },
            width: 150,
            height: 50,
            textColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}