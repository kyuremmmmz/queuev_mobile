import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';

class Toaster {
  void toast(BuildContext context, String message){
    return DelightToastBar(
      position: DelightSnackbarPosition.top,
      builder: (context) =>  ToastCard(
        color: Colors.redAccent,
        leading: Icon(Icons.error, size: 28, color: Colors.white),
        title: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    ).show(context);
  }
}