import 'package:flutter/material.dart';
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
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get name => _name;
  String get surname => _surname;
  String get password => _password;

  void signUserData(String name, String surname){
    _name = name;
    _surname = surname;
    notifyListeners();
  }
  Future<void> signUpUser(UserEntity user) async{
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

  Future<void> loginUser(LoginEntity user)async{
    _isLoading = true;
    notifyListeners();
    try {
      await authUsecases.callLoginUser(user);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = true;
    notifyListeners();

  }

}