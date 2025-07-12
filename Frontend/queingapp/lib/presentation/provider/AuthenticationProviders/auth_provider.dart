import 'package:flutter/material.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';
import 'package:queingapp/domain/usecases/GetAuth/auth_usecases.dart';

class AuthProvider with ChangeNotifier {
  final AuthUsecases authUsecases;

  bool _isLoading = false;
  String? _error;
  AuthProvider({required this.authUsecases});

  bool get isLoading => _isLoading;
  String? get error => _error;
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

}