import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';

class SuccessToaster {
  void toast(BuildContext context, String message) {
    return DelightToastBar(
      autoDismiss: true,
      snackbarDuration: Duration(seconds: 2),
      animationDuration: Duration(seconds: 1),
      position: DelightSnackbarPosition.top,
      builder: (context) => ToastCard(
        
        color: Colors.green,
        leading: Icon(Icons.check, size: 28, color: Colors.white),
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