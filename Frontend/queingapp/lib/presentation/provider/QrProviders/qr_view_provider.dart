import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart'
    hide BarcodeFormat;
import 'package:url_launcher/url_launcher.dart';

class QrViewProvider with ChangeNotifier {
  QRViewController? _controller;
  StreamSubscription? _scanSubscription;

  final StreamController<bool> _permissionController =
      StreamController<bool>.broadcast();
  final ImagePicker _imagePicker = ImagePicker();

  File? _qrCodeUploaded;
  String? _result;
  String? _uri;
  bool _isScanned = false;

  // Getters
  File? get qrCodeUploaded => _qrCodeUploaded;
  Stream<bool> get permissionStream => _permissionController.stream;
  String? get result => _result;
  String? get uri => _uri;
  bool get isScanned => _isScanned;
  QRViewController? get controller => _controller;

  void onQRViewCreated(QRViewController controller) {
    _controller = controller;
    _isScanned = false;

    // Cancel old subscription kung meron
    _scanSubscription?.cancel();

    _scanSubscription = controller.scannedDataStream.listen((scanData) {
      final rawCode = scanData.code;
      if (rawCode == null) return;

      // Reset before assigning
      _result = '';
      _uri = '';
      _isScanned = false;

      _result = rawCode;
      final urlParsing = Uri.parse(rawCode);
      final uri = "${urlParsing.scheme}://${urlParsing.host}";
      final categoryId = urlParsing.pathSegments.last;

      _uri = categoryId.toString();
      _result = uri;

      if (_result == 'https://queuevreservasion') {
        print('result: $_uri');
        _isScanned = true;
      }

      notifyListeners();
    });

    notifyListeners();
  }

  Future<void> scannedToFalse() async {
    _isScanned = false;
    _uri = '';
    _result = '';
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('no Permission')));
    }
  }

  Future<void> initStream() async {
    await Future.delayed(Duration.zero);
    _permissionController.add(true);
  }

  void _launchInBrowser(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  void dispose() {
    _scanSubscription?.cancel();
    _controller?.dispose();
    _permissionController.close();
    super.dispose();
  }
}
