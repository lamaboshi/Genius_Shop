import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/register/controller/register_controller.dart';
import 'package:genius_shop/app_router.dart';
import 'package:genius_shop/ui/widget/text_field.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';
import '../../../ui/widget/action_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height / 20),
                Text(
                  'Register to join us',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  'Welcome back! Please enter your details',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: Get.height / 18),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                          onChanged: (value) {
                            controller.user.value.email = value;
                          },
                          textInputType: TextInputType.text,
                          label: 'Email',
                        ),
                        TextFieldWidget(
                          onChanged: (value) {
                            controller.user.value.name = value;
                          },
                          textInputType: TextInputType.text,
                          label: 'name',
                        ),
                        TextFieldWidget(
                          onChanged: (value) {
                            controller.user.value.userName = value;
                          },
                          textInputType: TextInputType.text,
                          label: 'user Name',
                        ),

                        TextFieldWidget(
                          label: 'Create Password',
                          isPassword: true,
                          textInputType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            controller.user.value.password = value;
                          },
                          onPasswordStrengthChanged: (strength) {},
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a password';
                            if (value.length < 8)
                              return 'Password must be at least 8 characters';
                            return null;
                          },
                        ),
                        TextFieldWidget(
                          label: 'Confirm Password',
                          isPassword: true,
                          textInputType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            controller.password.value = value;
                          },
                          onPasswordStrengthChanged: (strength) {},
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a password';
                            if (controller.user.value.password!.compareTo(
                                  value,
                                ) !=
                                0)
                              return 'Passwords do not match';
                            if (value.length < 8)
                              return 'Password must be at least 8 characters';
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Obx(
                        () => CheckboxListTile(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                          fillColor:
                              controller.isAgree.value
                                  ? WidgetStatePropertyAll(Colors.black)
                                  : null,
                          value: controller.isAgree.value,
                          onChanged: (value) {
                            controller.isAgree.value = value!;
                          },
                          title: Text('i agree to Terms and condition'),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () =>
                        controller.isLoading.value
                            ? CircularProgressIndicator()
                            : ActionButton(
                              title: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                              withBorder: false,
                              onPressed: () async {
                                await controller.singUp();
                              },
                            ),
                  ),
                ),

                sp5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have an account?'),
                    InkWell(
                      onTap: () {
                        Get.rootDelegate.toNamed(AppRouter.logIn);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
