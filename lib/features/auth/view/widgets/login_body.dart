import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdh_event/features/auth/data/parameters/set_user_parameters.dart';
import 'package:tdh_event/features/auth/view/pages/forget_password_screen.dart';
import 'package:tdh_event/features/home/view/pages/main_screen.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/general_widgets/g_widget_button.dart';
import '../../../../core/general_widgets/g_widget_snack_bar.dart';
import '../../../../core/general_widgets/g_widget_text_field.dart';
import '../../../../core/utils/enums.dart';
import '../../controllers/auth_controller.dart';
import '../../data/parameters/login_parameters.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final AuthController controller = Get.find();
  final List<TextEditingController> controllers =
      List.generate(2, (index) => TextEditingController());
  final List<bool> errors = List.generate(2, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 26)),
                const Text(
                  'LOGIN',
                  style: TextStyle(
                      fontFamily: FontsAssets.alternategot1D,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 55),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 22)),
                const Text(
                  'Please fill out your details below...',
                  style: TextStyle(
                      fontFamily: FontsAssets.gotham,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 25)),
                GWidgetTextField(
                    controller: controllers[0],
                    isError: errors[0],
                    hintText: 'Email address*'),
                GWidgetTextField(
                    controller: controllers[1],
                    isError: errors[1],
                    isPassword: true,
                    hintText: 'Password*'),
                Obx(() => Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        GWidgetButton(
                          height: 69,
                          isLoading: controller.requestState.value ==
                              RequestState.loading,
                          onPressed: () async {
                            for (int i = 0; i < errors.length; i++) {
                              setState(() {
                                errors[i] = controllers[i].text.isEmpty;
                              });
                            }
                            if (!errors.contains(true)) {
                              await controller.login(LoginParameters(
                                  email: controllers[0].text,
                                  password: controllers[1].text));
                              if (controller.requestState.value ==
                                  RequestState.error) {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      GSnackBar(
                                              isSucess: false,
                                              body:
                                                  controller.errorMessage.value)
                                          .get());
                                }
                              } else {
                                await controller.setUser(SetUserParameters(
                                    user: controller.user.value));
                                await Get.offNamed(MainScreen.route,
                                    arguments: controller.user.value);
                              }
                            }
                          },
                          text: 'Login',
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        TextButton(
                            onPressed: () async {
                              await Get.toNamed(ForgetPasswordScreen.route);
                            },
                            child: Text(
                              'Forgotten Password?',
                              style: TextStyle(
                                  fontFamily: FontsAssets.alternategot1D,
                                  color: Colors.black.withOpacity(0.69),
                                  fontSize: 16),
                            )),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
