import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdh_event/features/auth/data/parameters/forget_password_parameters.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/general_widgets/g_widget_button.dart';
import '../../../../core/general_widgets/g_widget_snack_bar.dart';
import '../../../../core/general_widgets/g_widget_text_field.dart';
import '../../../../core/utils/enums.dart';
import '../../controllers/auth_controller.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final TextEditingController emailController = TextEditingController();
  final AuthController controller = Get.find();
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Forget Password',
                  style: TextStyle(
                      fontFamily: FontsAssets.alternategot1D,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 55),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 25)),
                GWidgetTextField(
                    controller: emailController,
                    isError: isError,
                    hintText: 'Email address*'),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                Obx(() => GWidgetButton(
                      height: 69,
                      isLoading:
                          controller.requestState.value == RequestState.loading,
                      onPressed: () async {
                        setState(() {
                          isError = emailController.text.isEmpty;
                        });
                        if (!isError) {
                          await controller.forgotPassword(
                              ForgetPasswordParameters(
                                  email: emailController.text));
                          if (controller.requestState.value ==
                              RequestState.error) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  GSnackBar(
                                          isSucess: false,
                                          body: controller.errorMessage.value)
                                      .get());
                            }
                          } else {
                            if (mounted) {
                              Future.delayed(const Duration(seconds: 4), () {
                                Navigator.pop(context);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  GSnackBar(
                                          isSucess: true,
                                          body: controller
                                              .forgotPasswordMessage.value)
                                      .get());
                            }
                          }
                        }
                      },
                      text: 'Send',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
