import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/form/qeue/dialog_screen.dart';
import 'package:queingapp/presentation/widgets/form/qeue/qeue_step1_form.dart';
import 'package:queingapp/presentation/widgets/form/qeue/qeue_step2_form.dart';
import 'package:queingapp/utils/AppPadding.dart';

class QeueReservationScreen extends StatefulWidget {
  const QeueReservationScreen({super.key});

  @override
  State<QeueReservationScreen> createState() => _QeueReservationScreenState();
}

class _QeueReservationScreenState extends State<QeueReservationScreen> {
  final PageController _pageController = PageController();
  final PageController _pageController2 = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    _pageController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (_pageController.page == 0) {
              Navigator.pop(context);
            }
            _pageController.previousPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
        ),
        title: const Text('Queue Reservation'),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.padding,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              QeueStep2Form(controller: _pageController),
              ReservationSuccessScreen(pageController: _pageController),
            ],
          ),
        ),
      ),
    );
  }
}
