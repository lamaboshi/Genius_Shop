import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app_router.dart';
import '../../../core/helper/constens.dart';
import '../../../ui/widget/action_button.dart';

class ConfirmEmailView extends StatelessWidget {
  const ConfirmEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height / 5),
              Text(
                'Confirm your email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              sp5,
              SizedBox(
                width: Get.width / 1.5,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Enter the email associated with your account and \n we’ll send an email with code to reset your password',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height / 17),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'Email',
                ),
              ),
              sp20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionButton(
                  title: Text(
                    'Send Code',
                    style: TextStyle(color: Colors.white),
                  ),
                  withBorder: false,
                  onPressed: () async {
                    Get.rootDelegate.toNamed(AppRouter.home);
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
