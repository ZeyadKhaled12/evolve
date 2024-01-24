import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdh_event/core/general_widgets/g_widget_animation_opacity.dart';
import 'package:tdh_event/core/utils/enums.dart';
import 'package:tdh_event/features/auth/view/pages/login_screen.dart';
import 'package:tdh_event/features/home/view/pages/main_screen.dart';

import '../../../../core/assets_manager.dart';
import '../../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String route = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController controller = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GWidgetAnimationOpacity(
            onEnd: () async {
              await controller.checkIfLogin();
              if (mounted) {
                if (controller.requestState.value == RequestState.error) {
                  await Navigator.pushReplacementNamed(
                      context, LoginScreen.route);
                } else {
                  await Get.offNamed(MainScreen.route,
                      arguments: controller.user.value);
                }
              }
            },
            widgetOpacity: const Text(
              'EVOLVE BEYOND',
              style: TextStyle(
                  fontFamily: FontsAssets.alternategot1D,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 40),
            ),
            seconds: 4),
      ),
    );
  }
}
