import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/containers/reusable_container_widget.dart';
import 'package:queingapp/presentation/widgets/form/qeue/qeue_step1_form.dart';
import 'package:queingapp/presentation/widgets/form/qeue/qeue_step2_form.dart';
import 'package:queingapp/utils/AppPadding.dart';

class QeueReservationScreen extends StatefulWidget {
  const QeueReservationScreen({super.key});

  @override
  State<QeueReservationScreen> createState() => _QeueReservationScreenState();
}

class _QeueReservationScreenState extends State<QeueReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Queue Reservation'),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.padding,
          child: PageView(
            children: [
                  QeueStep1Form(),
                  QeueStep2Form()
              ],
            )
          )
      ),
    );
  }
}