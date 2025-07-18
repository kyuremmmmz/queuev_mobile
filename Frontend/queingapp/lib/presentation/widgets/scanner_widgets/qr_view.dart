import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrView extends StatelessWidget {
  final GlobalKey qrKey;
  final QRViewCreatedCallback onQRViewCreated;
  final PermissionSetCallback callback;
  const QrView({super.key, required this.qrKey, required this.onQRViewCreated, required this.callback});

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 700.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.black,
          borderRadius: 0,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: callback,
    );

  }
}