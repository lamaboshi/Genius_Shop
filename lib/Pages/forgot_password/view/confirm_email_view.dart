import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:genius_shop/Pages/forgot_password/controller/forget_password_controller.dart';
import 'package:genius_shop/ui/widget/text_field.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';
import '../../../ui/widget/action_button.dart';

class ConfirmEmailView extends StatelessWidget {
  const ConfirmEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordController>();
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
              TextFieldWidget(
                onChanged: (value) {
                  controller.email.value = value;
                },
                textInputType: TextInputType.text,
                label: 'Email',
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
                    await controller.confirmEmail();
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
