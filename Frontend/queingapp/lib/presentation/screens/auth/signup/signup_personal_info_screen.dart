import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queingapp/presentation/widgets/form/auth/sign_up_personal_info.dart';
import 'package:queingapp/utils/AppPadding.dart';

class SignupPersonalInfoScreen extends StatefulWidget {
  final PageController controller;
  const SignupPersonalInfoScreen({super.key, required this.controller});

  @override
  State<SignupPersonalInfoScreen> createState() => _SignupPersonalInfoScreenState();
}

class _SignupPersonalInfoScreenState extends State<SignupPersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Padding(
            padding: AppPaddings.padding,
            child: Column(
            children: [
              SignUpPersonalInfo(
                pageController: widget.controller,
              )
            ],
          ),
          )
        ),
      )
    );
  }
}