import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdh_event/core/utils/routes.dart';
import 'package:tdh_event/features/auth/view/pages/splash_screen.dart';
import 'package:tdh_event/theme/theme.dart';
import 'core/network/certificate_verify.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: SplashScreen.route,
      getPages: routes,
    );
  }
}
