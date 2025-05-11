import 'package:flutter/material.dart';
import 'package:genius_shop/app_router.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';
import '../../../ui/widget/action_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                'Register to join us',
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
                        hintText: 'Email',
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
                        hintText: 'Create Password',
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
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ],
                ),
              ),

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
                      title: Text('i agree to Terms and condition'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionButton(
                  title: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  withBorder: false,
                  onPressed: () {},
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
                  onPressed: () {},
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
    );
  }
}
