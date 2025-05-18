import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/edit_profile/controller/edit_profile_controller.dart';
import 'package:genius_shop/core/helper/build_context_extension.dart';
import 'package:get/get.dart';

import '../../../core/api/user_role.dart';
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
      appBar: AppBar(
        leading: IconButton(
          style: context.actionBorderButtonStyle,
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              sp20,
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
              SizedBox(
                width: 130,
                height: 130,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(50),
                        image:
                            controller.user.value.avatarUrl == null
                                ? null
                                : DecorationImage(
                                  image: NetworkImage(
                                    controller.user.value.avatarUrl!,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        style: context.actionButtonStyle,
                        onPressed: !controller.isEdit.value ? null : () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color:
                              !controller.isEdit.value
                                  ? Colors.grey
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFieldWidget(
                        label: 'First Name',
                        isReadOnly: !controller.isEdit.value,
                        value: controller.user.value.firstName ?? "",
                        onChanged: (String value) {
                          controller.user.value.firstName = value;
                        },
                        textInputType: TextInputType.text,
                      ),
                      TextFieldWidget(
                        label: 'Last Name',
                        isReadOnly: !controller.isEdit.value,
                        value: controller.user.value.lastName ?? "",
                        onChanged: (String value) {
                          controller.user.value.lastName = value;
                        },
                        textInputType: TextInputType.text,
                      ),
                      TextFieldWidget(
                        label: 'Email',
                        isReadOnly: !controller.isEdit.value,
                        value: controller.user.value.email ?? "",
                        onChanged: (String value) {
                          controller.user.value.email = value;
                        },
                        textInputType: TextInputType.text,
                      ),
                      TextFieldWidget(
                        label: 'User Name',
                        isReadOnly: !controller.isEdit.value,
                        value: controller.user.value.userName ?? "",
                        onChanged: (String value) {
                          controller.user.value.userName = value;
                        },
                        textInputType: TextInputType.text,
                      ),
                      UnderlineDropdown(
                        hintText:
                            controller.isEdit.value
                                ? 'Role'
                                : controller.user.value.role!.first,
                        isReadOnly: !controller.isEdit.value,
                        items: UserRole.values.map((t) => t.name).toList(),
                      ),

                      controller.isEdit.value
                          ? TextFieldWidget(
                            label: 'Password',
                            onChanged: (value) {
                              controller.user.value.password = value;
                            },
                            textInputType: TextInputType.text,
                          )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
              sp10,

              !controller.isEdit.value
                  ? SizedBox.shrink()
                  : Padding(
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
