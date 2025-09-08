import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart' hide BarcodeFormat;
import 'package:qr_code_scanner_plus/src/types/barcode_format.dart' hide BarcodeFormat;
import 'package:queingapp/presentation/widgets/toasters/toaster.dart';
import 'package:url_launcher/url_launcher.dart';

class QrViewProvider with ChangeNotifier{
  QRViewController? _controller;
  final StreamController<bool> _permissionController = StreamController<bool>.broadcast();
  File? _qrCodeUploaded;
  File? get qrCodeUploaded => _qrCodeUploaded;
  Stream<bool> get permissionStream => _permissionController.stream;
  String? _result;
  bool _isScanned = false;
  QRViewController? get controller  => _controller;
  String? get result => _result;

  bool get isScanned => _isScanned;
  final ImagePicker _imagePicker = ImagePicker();
  void onQRViewCreated(QRViewController controller) {
    _controller = controller;
    _isScanned = false;
    notifyListeners();
    controller.scannedDataStream.listen((scanData) {
      _result = scanData.code;
      final urlParsing = Uri.parse(_result!);
      final uri = "${urlParsing.scheme}://${urlParsing.host}";
      _result = uri;
      if (_result == 'https://queuevreservasion') {
        _isScanned = true;
        print('result: $_result');
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  Future<void> scannedToFalse()async {
    _isScanned = false;
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
  final XFile? picked = await _imagePicker.pickImage(source: source);
  if (picked != null) {
    _qrCodeUploaded = File(picked.path);
      _result = _qrCodeUploaded!.path;
      _isScanned = true;
      notifyListeners();
  }
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