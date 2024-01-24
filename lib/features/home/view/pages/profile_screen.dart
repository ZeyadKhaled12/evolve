import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdh_event/features/home/view/pages/update_user_screen.dart';
import '../../../../core/assets_manager.dart';
import '../../../../core/utils/app_constance.dart';
import '../../../auth/view/pages/login_screen.dart';
import '../../controllers/home_controller.dart';
import '../widgets/profile_widgets/profile_widget_card_detail.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              'Profile',
              style: TextStyle(
                  fontFamily: FontsAssets.alternategot1D,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 55),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 25),
                  child: ProfileWidgetCardDetail(user: controller.user.value),
                ),
                Center(
                  child: TextButton(
                      onPressed: () async {
                        await Get.toNamed(
                          UpdateUserScreen.route,
                        );
                      },
                      child: const Text(
                        'Update information',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: AppConstance.heightOfBottomBar(context) + 15),
              child: TextButton(
                  onPressed: () async {
                    await controller.logout();
                    await Get.offNamed(LoginScreen.route);
                  },
                  child: const Text(
                    'LogOut',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  )),
            )
          ],
        ));
  }
}
