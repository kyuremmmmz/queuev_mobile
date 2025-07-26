import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/validators_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/containers/reusable_container_widget.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';

class QeueStep1Form extends StatefulWidget {
  final PageController pageController;
  const QeueStep1Form({super.key, required this.pageController});

  @override
  State<QeueStep1Form> createState() => _QeueStep1FormState();
}

class _QeueStep1FormState extends State<QeueStep1Form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ValidatorsProvider>(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          ReusableContainerWidget(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "FILL UP THE FOLLOWING:",
            style: GoogleFonts.dmSans(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 11,
          ),
          ReusableField(
              hintText: "eg. Juan Dela Cruz",
              validator: (value) {
                return provider.validateAll(value, "Full Name.");
              },
              controller: controller),
          const SizedBox(
            height: 346,
          ),
          Center(
            child: ReusableButton(
              title: "Next", 
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              }, 
              width: 150, 
              height: 50, 
              backgroundColor: Colors.black, 
              textColor: Colors.white,),
          )
        ],
      ),
      )
    );
  }
}
