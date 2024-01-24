import 'package:flutter/material.dart';

import '../widgets/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  static const String route = '/forgot_password';

  @override
  Widget build(BuildContext context) {
    return const ForgetPasswordBody();
  }
}
