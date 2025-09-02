import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StorageProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Text(
              'QUEUEV',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          // Drawer Items
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('ACCOUNT'),
            onTap: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('QUEUE STATUS'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('QUEUEING HISTORY'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/queing');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('SETTINGS'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 250),
          Divider(),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Log out'),
            onTap: () {
              USER.signOut();
            },
          ),
        ],
      ),
    );
  }
}