import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/containers/reusable_container_widget.dart';

class QeueStep1Form extends StatefulWidget {
  const QeueStep1Form({super.key});

  @override
  State<QeueStep1Form> createState() => _QeueStep1FormState();
}

class _QeueStep1FormState extends State<QeueStep1Form> {
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