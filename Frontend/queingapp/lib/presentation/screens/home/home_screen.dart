import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';
import 'package:queingapp/presentation/screens/home/qeue_reservation_screen.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';


import 'package:queingapp/presentation/widgets/scanner_widgets/qr_example_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider2 = Provider.of<QrViewProvider>(context);
    return provider2.isScanned ? const QeueReservationScreen() :  Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      
        actions: [
          ReusableButton(title: 'CODE',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          onPressed: (){
            Navigator.pushNamed(context, '/enterCode');
          }, width: 99, height: 50)
        ],
      ),
      body: QrExampleWidget()
    );
  }
}