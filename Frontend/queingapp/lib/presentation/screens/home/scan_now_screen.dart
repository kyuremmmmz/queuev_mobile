import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/drawer/drawer_widget.dart';
import 'package:queingapp/presentation/widgets/drawer/end_drawer_widget.dart';
import 'package:queingapp/presentation/widgets/floating_action_button/action_button_widget.dart';
import 'package:queingapp/utils/images.dart';

class ScanNowScreen extends StatefulWidget {
  const ScanNowScreen({super.key});

  @override
  State<ScanNowScreen> createState() => _ScanNowScreenState();
}

class _ScanNowScreenState extends State<ScanNowScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              _key.currentState!.openEndDrawer();
            }, 
          icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Column(
          children: [
            Opacity(
            opacity: 0.1,
            child: Image.asset(
              logo,
              height: 500,
            ),
          ),


            Text(
                  'QUEUEV',
                  style: TextStyle(color: const Color.fromARGB(255, 224, 224, 224), fontSize: 40),
                ),
          ],
        ),
      endDrawer: EndDrawerWidget(),
      drawer: DrawerWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
        callback: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
    );
  }

}



