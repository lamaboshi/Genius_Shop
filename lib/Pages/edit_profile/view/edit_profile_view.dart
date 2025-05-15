import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/edit_profile/controller/edit_profile_controller.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';
import '../../../ui/widget/action_button.dart';
import '../../../ui/widget/text_field.dart';
import '../../../ui/widget/under_line_dropdown.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditProfileController>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: Get.height / 7),
              Column(
                children: [
                  Text(
                    'Hi ,${controller.user.value.userName ?? ''}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    'Hi! you can edit your Information',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              sp20,
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(50),
                  image:
                      controller.user.value.avatarUrl == null
                          ? null
                          : DecorationImage(
                            image: NetworkImage(
                              controller.user.value.avatarUrl ?? '',
                            ),
                          ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFieldWidget(
                        label: 'First Name',
                        onChanged: (String value) {
                          controller.user.value.email = value;
                        },
                        textInputType: TextInputType.text,
                      ),
                      TextFieldWidget(
                        label: 'Last Name',
                        onChanged: (String value) {
                          controller.user.value.email = value;
                        },
                        textInputType: TextInputType.text,
                      ),
                      UnderlineDropdown(
                        hintText: 'Role',
                        items: ['user', 'user_1', 'user_2'],
                      ),

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
              ),
              sp10,

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
                            onPressed: () async {},
                          ),
                ),
              ),
              sp20,
            ],
          ),
        ),
      ),
    );
  }
}
