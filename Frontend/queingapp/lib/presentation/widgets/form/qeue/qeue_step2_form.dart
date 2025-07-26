import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/containers/reusable_container_widget.dart';

class QeueStep2Form extends StatefulWidget {
  const QeueStep2Form({super.key});

  @override
  State<QeueStep2Form> createState() => _QeueStep2FormState();
}

class _QeueStep2FormState extends State<QeueStep2Form> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ReusableContainerWidget(),
        ],
      ),
    );
  }
}