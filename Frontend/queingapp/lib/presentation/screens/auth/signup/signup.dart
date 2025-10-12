import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queingapp/presentation/widgets/appbar/auth_app_bar.dart';
import 'package:queingapp/presentation/widgets/form/auth/signup_form.dart';
import 'package:queingapp/utils/AppPadding.dart';

class Signup extends StatefulWidget {
  final PageController controller;
  const Signup({super.key, required this.controller});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> { 
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
              SignupForm(
                controller: widget.controller,
              )
            ],
          ),
          )
        ),
      )
    );
  }
}