import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdh_event/features/home/view/widgets/main_widgets/main_body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String route = '/main_screen';

  @override
  Widget build(BuildContext context) {
    return MainBody(
      user: Get.arguments,
    );
  }
}
