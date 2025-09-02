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
  String? _password;
  String? _surname;
  String? _email;

  // TextEditingControllers for each field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  // Getters for fields
  String? get name => _name;
  String? get userName => _userName;
  String? get birthday => _birthday;
  String? get address => _address;
  String? get phoneNumber => _phoneNumber;
  String? get password => _password;
  String? get email => _email;
  String? get surname => _surname;

  // Getters for controllers
  TextEditingController get nameController => _nameController;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get birthdayController => _birthdayController;
  TextEditingController get addressController => _addressController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get surName => _surNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;


  Future<void> updateProfile() async{
    final entity = UserEntity(
      password: _passwordController.text,
      email: _emailController.text,
      surname: _surNameController.text,
      name: _nameController.text, phone: _phoneNumberController.text,  username: _userNameController.text,  birthdate: _birthdayController.text, address: _addressController.text );
    await usecases.callUpdateAccount(entity);
    notifyListeners();
  }

  Stream<UserEntity?> get getUseCase => usecases.callgetAccount();

  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    _birthdayController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _surNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void init(){
    getUseCase.listen((account){
      if (account != null) {
      _name = account.name;
      _userNameController.text = account.username;
      _birthdayController.text = account.birthdate;
      _addressController.text = account.address ?? '';
      _phoneNumberController.text = account.phone;
      _surNameController.text = account.surname ?? '';
      _emailController.text = account.email ?? '';
      _passwordController.text = account.password ?? '';
    }
    notifyListeners();
    });
  }
}