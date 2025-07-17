import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';

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
      body: Center(
        child: ElevatedButton(onPressed: () async{
          await provider.deleteSecureToken(); 
        }, child: Text("Log out")),
      ),
    );
  }
}