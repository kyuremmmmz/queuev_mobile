import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';

class StorageProvider with ChangeNotifier {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final StreamController<String?> _tokenController = StreamController<String?>.broadcast();

  StorageProvider() {
    _initTokenStream();
  }

  Future<void> _initTokenStream() async {
    await Future.delayed(Duration.zero); // Ensure non-blocking initialization
    final token = await storage.read(key: 'token');
    debugPrint('Initial token from storage: $token');
    _tokenController.add(token);
  }

  Stream<String?> readSecureToken() {
    return _tokenController.stream;
  }

  Future<void> writeSecureToken(String token) async {
    await storage.write(key: 'token', value: token);
    debugPrint('Token written to storage: $token');
    _tokenController.add(token);
    notifyListeners();
  }

  Future<void> deleteSecureToken() async {
    await storage.delete(key: 'token');
    debugPrint('Token deleted from storage');
    _tokenController.add(null);
    notifyListeners();
  }
 
  @override
  void dispose() {
    _tokenController.close();
    super.dispose();
  }
}