import 'package:flutter/material.dart';

class ValidatorsProvider with ChangeNotifier {
  

  String? validateAll(String params, String nameOftheTextController){
    if (params.isEmpty) {
      notifyListeners();
      return "please enter your $nameOftheTextController";
    }
    notifyListeners();
    return null;
  }

  String? validatewithRegex(String params, String nameOfTheTextController){
    return null;
  

  }
}