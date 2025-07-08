import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      bottom: TabBar(
        tabs: [
          Tab(
            text: "Login",
          ),
          Tab(
            text: "Sign Up",
          ),
        ]
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}