import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queingapp/presentation/widgets/form/auth/signupnext_form.dart';
import 'package:queingapp/utils/AppPadding.dart';

class SignupNext extends StatefulWidget {
  final PageController controller;
  const SignupNext({super.key, required this.controller});

  @override
  State<SignupNext> createState() => _SignupNextState();
}

class _SignupNextState extends State<SignupNext> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          if (context.mounted) {
            if (widget.controller.page == 0) {
              Navigator.pop(context);
            }else{
              widget.controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            }
          }
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text('CREATE NEW ACCOUNT',
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          fontSize: 16
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(padding: AppPaddings.padding, child: SignupnextForm(controller: widget.controller,)),
        ),
      ),
    );
  }
}
