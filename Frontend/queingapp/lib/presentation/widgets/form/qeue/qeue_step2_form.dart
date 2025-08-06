import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/domain/entities/Widgets/text_field_entity.dart';
import 'package:queingapp/presentation/provider/FormProviders/qeue_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/containers/reusable_container_widget.dart';

class QeueStep2Form extends StatefulWidget {
  final PageController controller;
  const QeueStep2Form({super.key, required this.controller});

  @override
  State<QeueStep2Form> createState() => _QeueStep2FormState();
}

class _QeueStep2FormState extends State<QeueStep2Form> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QeueProvider>(context);
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 20),
          ReusableContainerWidget(),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.options.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                checkColor: Colors.black,
                tristate: true,
                checkboxShape: CircleBorder(),
                side: WidgetStateBorderSide.resolveWith((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.selected)) {
                    return const BorderSide(color: Colors.black);
                  }
                  return const BorderSide(color: Colors.black);
                }),

                activeColor: Colors.white,
                dense: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                  side: BorderSide(color: Colors.black),
                ),
                value: provider.selectedOption == index,
                title: Text(
                  provider.options[index],
                  style: GoogleFonts.dmSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (bool? value) {
                  provider.state(index, value);
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
          const SizedBox(height: 293),
          ReusableButton(
            textColor: Colors.white,
            backgroundColor: Colors.black,
            title: 'RESERVE',
            onPressed: () {
              widget.controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
            width: 200,
            height: 50,
          ),
        ],
      ),
    );
  }
}
