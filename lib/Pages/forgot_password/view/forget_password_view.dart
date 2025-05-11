import 'package:flutter/material.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
