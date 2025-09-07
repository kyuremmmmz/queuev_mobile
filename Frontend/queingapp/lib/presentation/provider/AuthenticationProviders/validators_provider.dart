import 'package:flutter/material.dart';

class ValidatorsProvider with ChangeNotifier {
  String? validateAll(String params, String nameOftheTextController) {
    if (params.isEmpty) {
      notifyListeners();
      return "please enter your $nameOftheTextController";
    }
    notifyListeners();
    return null;
  }
  String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  }

  List<String> errors = [];

  if (value.length < 8) {
    errors.add("• At least 8 characters");
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    errors.add("• At least one uppercase letter");
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    errors.add("• At least one lowercase letter");
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    errors.add("• At least one number");
  }
  if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
    errors.add("• At least one special character (!@#\$&*~)");
  }

  return errors.isEmpty ? null : errors.join("\n");
}

  String? validateWithRegex(String params, String nameOfTheTextController) {
    params = params.trim();
    switch (nameOfTheTextController.toLowerCase()) {
      case 'email':
        final emailRegex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        );
        if (!emailRegex.hasMatch(params)) {
          return 'Please enter a valid email address';
        }
        break;

      case 'phone':
        final phoneRegex = RegExp(r'^\+?[1-9]');
        if (!phoneRegex.hasMatch(params)) {
          return 'Please enter a valid phone number do not fill 0 (10-15 digits)';
        }
        break;
        
      case 'password':
        final passwordRegex = RegExp(
          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&-])[A-Za-z\d@$!%*?&-]{12,}$',
        );
        if (!passwordRegex.hasMatch(params)) {
          return 'Password must be at least 8 characters and include uppercase, lowercase, number, and special character';
        }
        break;

      default:
        return 'Invalid field name: $nameOfTheTextController';
    }

    return null;
  }
}