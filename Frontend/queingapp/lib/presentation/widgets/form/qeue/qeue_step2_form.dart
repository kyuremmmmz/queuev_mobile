import 'package:flutter/material.dart';
import 'package:queingapp/domain/entities/Widgets/text_field_entity.dart';
import 'package:queingapp/presentation/widgets/containers/reusable_container_widget.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';

class QeueStep2Form extends StatefulWidget {
  const QeueStep2Form({super.key});

  @override
  State<QeueStep2Form> createState() => _QeueStep2FormState();
}

class _QeueStep2FormState extends State<QeueStep2Form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  final generateController = List.generate(2, (int index) => TextEditingController());
  final List<TextFieldEntity> textFields = [
    TextFieldEntity(
      validator: null,
      suffixIcon: null,
      icon: null,
      isObscure: false,
      hintText: "eg. Juan Dela Cruz",
      controller: TextEditingController(),
    ),
    TextFieldEntity(
      validator: null,
      suffixIcon: null,
      icon: null,
      isObscure: false,
      hintText: "eg. 1234567890",
      controller: TextEditingController(),
    ),
  ];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ReusableContainerWidget(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2, // Example count, adjust as needed
            itemBuilder: (context, index) {
              return ReusableField(
                hintText: textFields[index].hintText,
                validator: textFields[index].validator,
                controller: textFields[index].controller,
                suffixIcon: textFields[index].suffixIcon,
                icon: textFields[index].icon,
              );
            },
          ),
        ],
      ),
    );
  }
}
