import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';

class EndDrawerWidget extends StatelessWidget {
  const EndDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StorageProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header
          SizedBox(
            height: 100.0,
            child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.brown),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(left: 20, bottom: 10,),
                child: Text('NOTIFICATIONS', style: GoogleFonts.dmSans(color: Colors.white)),
              ),
          ),
        ],
      ),
    );
  }
}