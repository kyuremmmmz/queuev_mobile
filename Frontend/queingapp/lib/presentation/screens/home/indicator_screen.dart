import 'package:flutter/material.dart';
import 'package:queingapp/const.dart';

class IndicatorScreen extends StatefulWidget {
  const IndicatorScreen({super.key});

  @override
  State<IndicatorScreen> createState() => _IndicatorScreenState();
}

class _IndicatorScreenState extends State<IndicatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: Stream.value(USER.currentUser!.emailVerified == false),
        builder: (context, asyncSnapshot) {
          final data = asyncSnapshot.data;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  data == true
                      ? Icon(Icons.check, size: 80, color: Colors.green)
                      : Icon(
                          Icons.email_outlined,
                          size: 80,
                          color: Colors.blue,
                        ),
                  SizedBox(height: 20),
                  Text(
                    "Verify Your Email",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "To continue, please follow these steps:",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),

                  // Steps
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "1. Open your email inbox.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "2. Look for the verification email we sent you.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "3. Click the verification link inside the email.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "4. Return to the app and sign in again.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
