import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';
import 'package:queingapp/presentation/widgets/scanner_widgets/qr_view.dart';

class QrExampleWidget extends StatefulWidget {
  const QrExampleWidget({super.key});

  @override
  State<QrExampleWidget> createState() => _QrExampleWidgetState();
}

class _QrExampleWidgetState extends State<QrExampleWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    final provider = Provider.of<QrViewProvider>(context, listen: false);
    if (Platform.isAndroid) {
      provider.controller!.pauseCamera();
    }
    provider.controller!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QrViewProvider>(context);
    return Column(
      children: [
        Expanded(
          child: QrView(
          qrKey: qrKey, 
          onQRViewCreated: provider.onQRViewCreated, 
          callback: (ctrl, p) => provider.onPermissionSet(context, ctrl, p)
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: (provider.result!=null || provider.result != 'https://queuevreservasion') ?
            Text('Invalid qr code') : const Text("Scan a code"),
          )
          )
      ],
    );
  }
}