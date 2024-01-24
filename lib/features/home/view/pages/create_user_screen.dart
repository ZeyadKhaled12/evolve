import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/create_user_widgets/create_user_body.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});
  static const String route = '/create_user';

  @override
  Widget build(BuildContext context) {
    return CreateUserBody(user: Get.arguments);
  }
}
