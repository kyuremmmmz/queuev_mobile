import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/containers/profile_container.dart';
import 'package:queingapp/presentation/widgets/form/auth/account_form.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileContainer(),
            const SizedBox(height: 20,),
            AccountForm()
          ],
        ),
        )
      ),
    );
  }
}