import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';
import 'package:queingapp/presentation/screens/screen_page_view/qeueing_screen_page_view.dart';

import 'package:queingapp/presentation/widgets/scanner_widgets/qr_example_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StorageProvider>(context);
    final provider2 = Provider.of<QrViewProvider>(context);
    return provider2.isScanned ? const QeueingScreenPageView() :  Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      
        actions: [
          IconButton(
            icon: provider2.isScanned ? const Icon(Icons.logout) :const Icon(Icons.image),
            onPressed: () async {
              await provider.deleteSecureToken();
            },
          ),
        ],
      ),
      body: QrExampleWidget()
    );
  }
}