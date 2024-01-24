import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdh_event/core/utils/enums.dart';
import 'package:tdh_event/features/auth/models/user/user.dart';
import 'package:tdh_event/features/home/models/update_info.dart';
import '../../../../core/assets_manager.dart';
import '../../../../core/general_widgets/g_widget_button.dart';
import '../../../../core/general_widgets/g_widget_snack_bar.dart';
import '../../../../core/general_widgets/g_widget_text_field.dart';
import '../../controllers/home_controller.dart';
import '../../data/parameters/update_info_parameters.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});
  static const route = '/update_user_route';

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());
  HomeController controller = Get.find();

  final List<bool> errors = List.generate(4, (index) => false);

  @override
  void initState() {
    controllers[0] =
        TextEditingController(text: controller.user.value.details!.name);
    controllers[1] =
        TextEditingController(text: controller.user.value.details!.email);
    controllers[2] =
        TextEditingController(text: controller.user.value.details!.phone);
    controllers[3] =
        TextEditingController(text: controller.user.value.details!.whatsapp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 26)),
                  const Text(
                    'Update Information',
                    style: TextStyle(
                        fontFamily: FontsAssets.alternategot1D,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 55),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 22)),
                  GWidgetTextField(
                      controller: controllers[0],
                      isError: errors[0],
                      hintText: 'Name'),
                  GWidgetTextField(
                      controller: controllers[1],
                      isError: errors[1],
                      hintText: 'Email'),
                  GWidgetTextField(
                      controller: controllers[2],
                      isError: errors[2],
                      hintText: 'Phone number'),
                  GWidgetTextField(
                      controller: controllers[3],
                      isError: errors[3],
                      hintText: 'Whats app number'),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.only(
                          bottom: 25,
                          top: MediaQuery.of(context).size.height * 1 / 8),
                      child: GWidgetButton(
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
                            User user = controller.user.value;
                            await controller.updateUser(UpdateInfoParameters(
                                token: user.token!,
                                updateInfo: UpdateInfo(
                                  name:
                                      controllers[0].text == user.details!.name
                                          ? null
                                          : controllers[0].text,
                                  email:
                                      controllers[1].text == user.details!.email
                                          ? null
                                          : controllers[1].text,
                                  phoneNumber:
                                      controllers[2].text == user.details!.phone
                                          ? null
                                          : controllers[2].text,
                                  whatsAppNumber: controllers[3].text ==
                                          user.details!.whatsapp
                                      ? null
                                      : controllers[3].text,
                                )));
                            if (mounted) {
                              if (controller.requestState.value ==
                                  RequestState.error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    GSnackBar(
                                            isSucess: false,
                                            body: controller.errorMessage.value)
                                        .get());
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    GSnackBar(
                                            isSucess: true,
                                            body:
                                                'User has been updated successfully')
                                        .get());
                                await Future.delayed(const Duration(seconds: 2),
                                    () {
                                  Navigator.pop(context);
                                });
                              }
                            }
                          }
                        },
                        text: 'Update',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
