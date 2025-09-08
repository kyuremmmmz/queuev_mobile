import 'package:flutter/material.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/domain/entities/Auth/login_entity.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';
import 'package:queingapp/domain/usecases/GetAuth/auth_usecases.dart';

class AuthProvider with ChangeNotifier {
  final AuthUsecases authUsecases;
  AuthProvider({required this.authUsecases});
  bool _isLoading = false;
  late String? _error;
  late String _name;
  late String _surname;
  late String _password;
  late String _birthdate;
  late String _email;
  late String _phone;
  late String _address;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get name => _name;
  String get surname => _surname;
  String get password => _password;
  String get birthdate => _birthdate;
  String get email => _email;
  String get phone => _phone;
  String get address => _address;
  void signUserData(String name, String surname) {
    _name = name;
    _surname = surname;
    notifyListeners();
  }

  void signPersonalInfo(String month, String day, String year, String phone, String address, String email) {
    _birthdate = '$month,$day, $year';
    _phone = phone;
    _address = address;
    _email = email;
    print('address gago: $address');
    notifyListeners();
  }

  Future<void> signUpUser(UserEntity user) async {
    _isLoading = true;
    notifyListeners();
    try {
      await authUsecases.callcreateUser(user);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginUser(LoginEntity user) async {
    _isLoading = true;
    notifyListeners();
    try {
      await authUsecases.callLoginUser(user);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
