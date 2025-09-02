// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';
import 'package:queingapp/domain/usecases/GetAuth/update_account_usecases.dart';

class ChangeAccountProvider with ChangeNotifier {
  final UpdateAccountUsecases usecases;
  ChangeAccountProvider({
    required this.usecases,
  });

  // Private fields
  String? _name;
  String? _userName;
  String? _birthday;
  String? _address;
  String? _phoneNumber;

  // TextEditingControllers for each field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  // Getters for fields
  String? get name => _name;
  String? get userName => _userName;
  String? get birthday => _birthday;
  String? get address => _address;
  String? get phoneNumber => _phoneNumber;

  // Getters for controllers
  TextEditingController get nameController => _nameController;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get birthdayController => _birthdayController;
  TextEditingController get addressController => _addressController;
  TextEditingController get phoneNumberController => _phoneNumberController;


  Future<void> updateProfile() async{
    final entity = UserEntity(name: _nameController.text, phone: _phoneNumberController.text,  username: _userNameController.text,  birthdate: _birthdayController.text, address: _addressController.text );
    await usecases.callUpdateAccount(entity);
    _nameController.clear();
    _phoneNumberController.clear();
    _userNameController.clear();
    _birthdayController.clear();
    _addressController.clear();
    notifyListeners();
  }

  // Dispose controllers to prevent memory leaks
  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    _birthdayController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}