import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/data/source/queue/queue_service.dart';
import 'package:queingapp/domain/entities/queues/queue_dynamic_entity.dart';
import 'package:queingapp/domain/entities/queues/queues_entity.dart';
import 'package:queingapp/injection.dart';
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
      stream: provider2.result != 'https://queuevreservasion'  ? provider1.streamDynamicListByCode(int.parse(provider2.result!)) : provider1.streamDynamicListByUid(provider2.uri!),
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
        .expand((e) => e.categories ?? [])
        .map((cat) => {
              'id': cat.id ?? '',
              'name': cat.name ?? 'No name',
              'queueLimit': cat.queueLimit ?? 0,
              'timeLimit': cat.timeLimit ?? '',
            })
        .toList();

        final options2 = snapshot.data!
            .whereType<QueueDynamicEntity>()
            .map((e) => {'id': e.categoryId, 'name': e.name, 'address': e.address,  'note': e.note})
            .where((map) => map['name'] != null && map['id'] != null && map['address'] != null && map['note'] != null, )
            .toList();


        return Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ReusableContainerWidget( 
                    name: provider1.selectedOption != null 
                        ? options2[0]['name']! 
                        : '', 
                    address: provider1.selectedOption != null 
                        ? options2[0]['address'] ?? ''
                        : '',
                  ),
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
                          options[index]['name'] ?? 'Unnamed Category',
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
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                  ),

                const SizedBox(height: 20),
                ReusableButton(
                  textColor: Colors.white,
                  backgroundColor: Colors.black,
                  title: 'RESERVE',
                  onPressed: () async {
                    if (provider1.selectedOption == null) {
                      Toaster().toast(context, 'Please select category');
                      return;
                    }

                    try {
                      final entity = QueuesEntity(
                        catId: options[provider1.selectedOption!]['id']!,
                        documentReference: options2[0]['id']!,
                        name: provider1.name.text,
                        type: options2[0]['name'] ?? '',
                        index: 0,
                        address: options2[0]['address'] ?? '',
                        status: '',
                        note: options2[0]['note'] ?? '',
                      );

                      await provider1.useCase.callCreateQueue(entity, context);

                      if (!context.mounted) return;
                      widget.controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );

                    } catch (e) {
                      provider2.scannedToFalse();
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