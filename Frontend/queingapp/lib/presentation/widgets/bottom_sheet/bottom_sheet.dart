import 'package:flutter/material.dart';
import 'package:queingapp/injection.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';

class BottomSheetH {

  // ========== BOTTOM SHEET FUNCTION ==========
void showCodeEntryBottomSheet({
  required BuildContext context,
  required int length,
  required String title,
  String? subtitle,
  required void Function(String code) onSubmit,
}) {
  final TextEditingController controller = TextEditingController();
  final provider = sl<QrViewProvider>();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              maxLength: length,
              decoration: InputDecoration(
                hintText: 'Enter $length-digit code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                counterText: "",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final code = controller.text.trim();
                if (code.length == length) {
                  Navigator.pop(context);
                  onSubmit(code);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter a $length-digit code.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Submit'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}

}
