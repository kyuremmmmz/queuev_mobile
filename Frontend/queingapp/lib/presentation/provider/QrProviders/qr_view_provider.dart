import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class QrViewProvider with ChangeNotifier{
  QRViewController? _controller;
  final StreamController<bool> _permissionController = StreamController<bool>.broadcast();
  Stream<bool> get permissionStream => _permissionController.stream;
  Barcode? _result;
  bool _isScanned = false;
  QRViewController? get controller  => _controller;
  Barcode? get result => _result;
  bool get isScanned => _isScanned;
  
  void onQRViewCreated(QRViewController controller) {
    _controller = controller;
    _isScanned = false;
    notifyListeners();
    controller.scannedDataStream.listen((scanData) {
      _result = scanData;
      _isScanned = true;
      notifyListeners();
    });
    notifyListeners();
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
  Future<void> initStream() async {
    await Future.delayed(Duration.zero);
    _permissionController.add(true);
  }

  void _launchInBrowser(String url)async{
    await launchUrl(Uri.parse(url));
  }

}