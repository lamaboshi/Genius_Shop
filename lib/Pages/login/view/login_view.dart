import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/login/controller/login_controller.dart';
import 'package:genius_shop/app_router.dart';
import 'package:get/get.dart';
import '../../../core/helper/constens.dart';
import '../../../ui/widget/action_button.dart';
import '../../../ui/widget/text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LogInController>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              SizedBox(height: Get.height / 7),
              Column(
                children: [
                  Text(
                    'Hi ,Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    'Welcome back! Please enter your details',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              SizedBox(height: Get.height / 17),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFieldWidget(
                      label: 'Email',
                      onChanged: (String value) {
                        controller.user.value.email = value;
                      },
                      textInputType: TextInputType.text,
                    ),

                    TextFieldWidget(
                      label: 'Password',
                      onChanged: (value) {
                        controller.user.value.password = value;
                      },
                      textInputType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              sp10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CheckboxListTile(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      fillColor: WidgetStatePropertyAll(Colors.black),
                      value: true,
                      onChanged: (value) {},
                      title: Text('Remember me'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.rootDelegate.toNamed(AppRouter.password);
                    },
                    child: Text('Forget password ?!'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () =>
                      controller.isLoading.value
                          ? Center(child: CircularProgressIndicator())
                          : ActionButton(
                            title: Text(
                              'LogIn',
                              style: TextStyle(color: Colors.white),
                            ),
                            withBorder: false,
                            onPressed: () async {
                              await controller.logIn();
                            },
                          ),
                ),
              ),
              sp20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Or',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
              ),
              sp20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionButton(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icons_google.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Continue with Google',
                        style: TextStyle(fontSize: 21),
                      ),
                    ],
                  ),
                  withBorder: true,
                  onPressed: () async {},
                ),
              ),
              sp5,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont\'t have an account?'),
                  InkWell(
                    onTap: () {
                      Get.rootDelegate.toNamed(AppRouter.register);
                    },
                    child: Text(
                      'Register',
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
    );
  }
}
