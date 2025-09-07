import 'package:flutter/material.dart';
import 'package:queingapp/domain/entities/Widgets/list_content_entity.dart';
import 'package:queingapp/presentation/widgets/dialogs/dialog.dart';
import 'package:queingapp/presentation/widgets/dialogs/logout_dialog.dart';
import 'package:queingapp/presentation/widgets/list_views/list_content_view.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final List<ListContentEntity> _list;

  @override
  void initState() {
    super.initState();
    _list = [
      ListContentEntity(
        label: 'Change Password',
        callback: () {
          Navigator.pushNamed(context, '/changePassword');
        },
        icon: Icons.key,
        width: 150.0,
        height: 150.0,
      ),
      ListContentEntity(
        label: 'Log out',
        callback: () {
          showLogoutDialog(context);
          Navigator.pop(context);
        },
        icon: Icons.logout,
        width: 150.0,
        height: 150.0,
      ),
      ListContentEntity(
        label: 'Delete account',
        callback: () {
          showDeleteAccountDialog(context);
        },
        icon: Icons.delete,
        width: 150.0,
        height: 150.0,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'), 
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return ListContentView(
              label: _list[index].label,
              callback: _list[index].callback,
              icon: _list[index].icon,
              width: _list[index].width,
              height: _list[index].height,
            );
          },
        ),
      ),
    );
  }
}