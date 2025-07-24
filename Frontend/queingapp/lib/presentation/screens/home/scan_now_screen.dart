import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/floating_action_button/action_button_widget.dart';

class ScanNowScreen extends StatefulWidget {
  const ScanNowScreen({super.key});

  @override
  State<ScanNowScreen> createState() => _ScanNowScreenState();
}

class _ScanNowScreenState extends State<ScanNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          onPressed: () {
            
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
        callback: (){
          Navigator.pushNamed(context, '/home');
        },
      )
    );
  }
}