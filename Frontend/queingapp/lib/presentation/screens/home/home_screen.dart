import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';
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
    return Scaffold(
      body: QrExampleWidget()
    );
  }
}