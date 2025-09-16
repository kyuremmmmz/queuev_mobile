import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/domain/entities/queues/queue_dynamic_entity.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';
import 'package:queingapp/presentation/provider/QueueProvider/queue_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/containers/reusable_container_widget.dart';
import 'package:queingapp/presentation/widgets/form/qeue/dialog_wrong.dart';
import 'package:queingapp/presentation/widgets/toasters/toaster.dart';

class QeueStep2Form extends StatefulWidget {
  final PageController controller;
  const QeueStep2Form({super.key, required this.controller});

  @override
  State<QeueStep2Form> createState() => _QeueStep2FormState();
}

class _QeueStep2FormState extends State<QeueStep2Form> {
  @override
  Widget build(BuildContext context) {
    final provider1 = context.watch<QueueProvider>();
    final provider2 = Provider.of<QrViewProvider>(context, listen: false);

    return StreamBuilder<List<QueueDynamicEntity?>>(
      stream: provider1.streamDynamicListByUid(provider2.uri!), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const DialogWrong();
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const DialogWrong();
        }

        final options = snapshot.data!
            .whereType<QueueDynamicEntity>()
            .map((e) => e.name)
            .where((name) => name.isNotEmpty)
            .toList();

        return Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ReusableContainerWidget(),
                const SizedBox(height: 20),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      checkColor: Colors.black,
                      tristate: true,
                      checkboxShape: const CircleBorder(),
                      side: WidgetStateBorderSide.resolveWith((states) {
                        return const BorderSide(color: Colors.black);
                      }),
                      activeColor: Colors.white,
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black),
                      ),
                      value: provider1.selectedOption == index,
                      title: Text(
                        options[index],
                        style: GoogleFonts.dmSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (bool? value) {
                        provider1.state(index, value);
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
                const SizedBox(height: 20),
                ReusableButton(
                  textColor: Colors.white,
                  backgroundColor: Colors.black,
                  title: 'RESERVE',
                  onPressed: () {
                    if (provider1.selectedOption == null) {
                      Toaster().toast(context, 'Please select category');
                    } else {
                      print('qr:${provider2.uri}');
                      provider1.createQueue(); // ✅ pass the list
                      widget.controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  width: 200,
                  height: 50,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
