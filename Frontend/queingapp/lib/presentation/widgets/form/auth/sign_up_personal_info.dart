import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/validators_provider.dart';
import 'package:queingapp/presentation/widgets/buttons/reusable_button.dart';
import 'package:queingapp/presentation/widgets/checkboxes/checkboxes.dart';
import 'package:queingapp/presentation/widgets/inputs/reusable_field.dart';

class SignUpPersonalInfo extends StatefulWidget {
  final PageController pageController;
  const SignUpPersonalInfo({super.key, required this.pageController});

  @override
  State<SignUpPersonalInfo> createState() => _SignUpPersonalInfoState();
}

class _SignUpPersonalInfoState extends State<SignUpPersonalInfo> {
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _email = TextEditingController();
  final _key = GlobalKey<FormState>();
  String selectedMonth = 'January';
  String selectedDay = '1';
  String selectedYear =
      '2000'; // Changed to a valid year within the list (e.g., '2000' is between 1925 and 2024)
  bool agreedToTerms = false;

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final List<String> days = List.generate(
    31,
    (index) => (index + 1).toString(),
  );
  final List<String> years = List.generate(
    100,
    (index) => (2024 - index).toString(),
  );

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ValidatorsProvider>(context);
    final provider1 = Provider.of<AuthProvider>(context);
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),

          // Address Section
          const Text(
            "ADDRESS",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          ReusableField(
            validator: (value) {
              return provider.validateAll(value, 'address');
            },
            controller: _addressController,
          ),
          const SizedBox(height: 30),
          const Text(
            "EMAIL",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 10),
          ReusableField(
            validator: (value) {
              return provider.validateAll(value, 'email');
            },
            controller: _email,
          ),

          const SizedBox(height: 30),
          const Text(
            "PHONE NUMBER",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          
          const SizedBox(height: 10),
          ReusableField(
            validator: (value) {
              return provider.validateAll(value, 'phone');
            },
            controller: _phoneController,
          ),

          const SizedBox(height: 40),
          Center(
            child: ReusableButton(
              title: "NEXT",
              onPressed: !agreedToTerms ? null : () {
                if (_key.currentState!.validate() && agreedToTerms) {
                  provider1.signPersonalInfo(
                    selectedMonth,
                    selectedDay,
                    selectedYear,
                    _phoneController.text,
                    _addressController.text,
                    _email.text,
                  );
                  widget.pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              width: 200,
              height: 50,
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ),

          const SizedBox(height: 30),

          Checkboxes(
            onChanged: (value) {
              setState(() {
                agreedToTerms = value!;
              });
            },
            isChecked: agreedToTerms,
          ),
        ],
      ),
    );
  }
}
