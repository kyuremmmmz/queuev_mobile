import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/data/source/queue/queue_service.dart';
import 'package:queingapp/injection.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';
import 'package:queingapp/utils/AppPadding.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QrViewProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('QUEUE RESERVATION',
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w500,
          fontSize: 18
        ),
        ),
      ),
      body: Padding(
        padding: AppPaddings.padding,
        child: Form(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter code',
          style: GoogleFonts.dmSans(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 9,),
          ReusableField(controller: provider.codeController),
          const SizedBox(height: 14,),
          Center(
            child: ReusableButton(
            title: 'Search', 
            onPressed: ()async{
              final service = QueueService();
              provider.scannedToTrue();
              print('codeeee: ${provider.result}');
              final services = await service.getCategoriesByCode(provider.result ?? '', context);
              if (services.isEmpty) {
                provider.codeController.clear();
                return;
              }
              Navigator.pop(context);
            }, 
            width: 150, 
            height: 50, 
            textColor: Colors.white, 
            backgroundColor: Colors.black,),
          )
        ],
      ),
      )
      )
    );
  }
}