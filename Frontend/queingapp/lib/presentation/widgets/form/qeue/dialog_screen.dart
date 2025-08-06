import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';

class ReservationSuccessScreen extends StatelessWidget {
  final PageController pageController;
  const ReservationSuccessScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Push card to center, button to bottom
          children: [
            Expanded(
              child: Center(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ), // Black border
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'QUEUE RESERVATION',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        Container(
                          width: 420,
                          height: 320,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 80.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        const Text(
                          'SUCCESSFUL!',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Next Button
            SizedBox(
              width: double.infinity,
              height: 50.0, // Set button height
              child: Center(
                child: ReusableButton(
                  title: "Next",
                  onPressed: () {
                    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                  },
                  width: 150,
                  height: 50,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                ),
              )
            ),
          ],
        )
        );
  }
}
