import 'package:flutter/material.dart';

class QeueProvider with ChangeNotifier {
  int? _selectedOption;
  final List<String> _options = ['ENROLLMENT', 'REGISTRAR OFFICE'];

  int? get selectedOption => _selectedOption;
  List<String> get options => _options;

  Future<void> state(int? index, bool? value) async {
    if (value == true) {
      _selectedOption = index;
      notifyListeners();
    } else {
      _selectedOption = null;
      notifyListeners();
    }
    notifyListeners();
  }
}
