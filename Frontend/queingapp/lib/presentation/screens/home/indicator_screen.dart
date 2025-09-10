import 'package:flutter/material.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';

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
        stream: Stream.value(USER.currentUser!.emailVerified),
        builder: (context, asyncSnapshot) {
          final data = asyncSnapshot.data;
          print('dataaa: ${data}');
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
                    data == true
                        ? "Email is already verified please login"
                        : "Verify Your Email",
                    style: TextStyle(
                      color: data == true ? Colors.green : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
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
                  const SizedBox(height: 30),
                  ?data == true
                      ? ReusableButton(
                          title: 'Proceed to login',
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                        )
                      : null,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
