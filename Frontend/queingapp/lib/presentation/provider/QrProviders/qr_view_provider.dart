import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class QrViewProvider with ChangeNotifier{
  QRViewController? _controller;
  Barcode? _result;

  QRViewController? get controller  => _controller;
  Barcode? get result => _result;

  void onQRViewCreated(QRViewController controller) {
    notifyListeners();
    _controller = controller;
    controller.scannedDataStream.listen((scanData) {
      _result = scanData;
      _launchInBrowser(_result!.code.toString());
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

  void _launchInBrowser(String url)async{
    await launchUrl(Uri.parse(url));
  }

}