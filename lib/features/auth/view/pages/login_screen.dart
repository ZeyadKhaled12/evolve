import 'package:flutter/material.dart';

import '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String route = '/login_screen';

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}
