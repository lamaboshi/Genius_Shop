import 'package:flutter/material.dart';
import 'package:genius_shop/app_router.dart';
import 'package:genius_shop/core/helper/constens.dart';
import 'package:get/get.dart';

import '../../../ui/widget/action_button.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: Get.height / 5),
              Text(
                'Create new password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                'Welcome back! Please enter your details',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: Get.height / 17),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText: 'Create new password',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText: 'Confirm password',
                      ),
                    ),
                  ],
                ),
              ),

              CircleCheckbox(
                title: 'I agree to Terms and condition',
                value: true,
                onChanged: (value) {},
              ),
              CircleCheckbox(
                title: 'I agree to Terms and condition',
                value: false,
                onChanged: (value) {},
              ),
              sp20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionButton(
                  title: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  withBorder: false,
                  onPressed: () {
                    Get.rootDelegate.toNamed(AppRouter.confirm);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String title;

  const CircleCheckbox({
    required this.value,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onChanged(!value),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
                color: value ? Colors.green : Colors.transparent,
              ),
              child: Icon(
                Icons.check,
                size: 16,
                color: value ? Colors.white : Colors.grey,
              ),
            ),
            sp5,
            Text(title, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
