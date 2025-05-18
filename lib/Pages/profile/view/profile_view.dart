import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/home/controller/home_controller.dart';
import 'package:genius_shop/Pages/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../../../app_router.dart';
import '../../../core/api/card_service.dart';
import '../../../core/helper/constens.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                sp10,
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
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
                  child:
                      controller.user.value.avatarUrl == null
                          ? Icon(Icons.account_circle, size: 100)
                          : SizedBox.shrink(),
                ),
                sp10,
                Text(
                  controller.user.value.name ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.rootDelegate.toNamed(
                        AppRouter.editProfile,
                        arguments: false,
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.grey),
                    ),
                    leading: Icon(Icons.info),
                    title: Text('Information'),
                  ),
                ),
                sp5,
                Card(
                  child: ListTile(
                    onTap: () {
                      CardService.clearCard();
                      Get.find<HomeController>().updateCountCard();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.grey),
                    ),
                    leading: Icon(Icons.cleaning_services_rounded),
                    title: Text('Clear My Bug'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
