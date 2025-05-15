import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          sp20,
          sp20,
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.amber,
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
          sp10,
          Text(
            controller.user.value.name ?? "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ],
      ),
    );
  }
}
