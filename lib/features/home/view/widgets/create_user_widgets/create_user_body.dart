import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdh_event/core/utils/enums.dart';
import 'package:tdh_event/features/auth/models/user/user.dart';
import 'package:tdh_event/features/home/controllers/home_controller.dart';
import 'package:tdh_event/features/home/data/parameters/add_user_form_parameters.dart';
import '../../../../../core/general_fun.dart';
import '../../../../../core/general_widgets/g_widget_button.dart';
import '../../../../../core/general_widgets/g_widget_snack_bar.dart';
import '../../../models/user_form.dart';
import 'create_user_widget_bot.dart';
import 'create_user_widget_top.dart';

class CreateUserBody extends StatefulWidget {
  const CreateUserBody({super.key, required this.user});
  final User user;

  @override
  State<CreateUserBody> createState() => _CreateUserBodyState();
}

class _CreateUserBodyState extends State<CreateUserBody> {
  final HomeController controller = Get.find();
  final List<TextEditingController> controllers =
      List.generate(3, (index) => TextEditingController());
  final List<bool> errorsTop = List.generate(3, (index) => false);

  final List<bool> errorsBot = List.generate(6, (index) => false);
  final List<String> dtopDownChosen = List.generate(4, (index) => '');
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController brandSmokedController = TextEditingController();
  bool isSmokedChecked = false;
  CountryCode countryCode = CountryCode.fromCountryCode('SA');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CreateUserWidgetTop(
                    controllers: controllers, errors: errorsTop),
                CreateUserWidgetBot(
                  errors: errorsBot,
                  isSmokedChecked: isSmokedChecked,
                  numberController: phoneNumberController,
                  brandSmokedController: brandSmokedController,
                  onChanged: (value) {
                    setState(() {
                      countryCode = value;
                    });
                  },
                  onCheckedFun: () {
                    setState(() {
                      isSmokedChecked = !isSmokedChecked;
                    });
                  },
                  onChangedFuns: List.generate(
                      dtopDownChosen.length,
                      (index) => (value) {
                            if (index == 0) {
                              setState(() {
                                dtopDownChosen[0] = value;
                              });
                            }
                            if (index == 1) {
                              setState(() {
                                dtopDownChosen[1] = value;
                              });
                            }
                            if (index == 2) {
                              setState(() {
                                dtopDownChosen[2] = value;
                              });
                            }
                            if (index == 3) {
                              setState(() {
                                dtopDownChosen[3] = value;
                              });
                            }
                          }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: GWidgetButton(
                      height: 69,
                      isLoading:
                          controller.requestState.value == RequestState.loading,
                      onPressed: () async {
                        for (int i = 0; i < errorsTop.length; i++) {
                          setState(() {
                            errorsTop[i] = controllers[i].text.isEmpty;
                          });
                        }
                        setState(() {
                          errorsBot[0] = phoneNumberController.text.isEmpty;
                        });
                        setState(() {
                          errorsBot[1] = dtopDownChosen[0].isEmpty;
                          errorsBot[2] = dtopDownChosen[1].isEmpty;
                          errorsBot[3] = dtopDownChosen[2].isEmpty;
                        });

                        if (isSmokedChecked) {
                          errorsBot[4] = brandSmokedController.text.isEmpty;
                          errorsBot[5] = dtopDownChosen[3].isEmpty;
                        }

                        if (!errorsTop.contains(true) &&
                            !errorsBot.contains(true)) {
                          UserForm userForm = UserForm(
                              fName: controllers[0].text,
                              lName: controllers[1].text,
                              email: controllers[2].text,
                              mobile: phoneNumberController.text,
                              nationality: dtopDownChosen[0],
                              city: dtopDownChosen[1],
                              age: dtopDownChosen[2],
                              countryCode: countryCode.code,
                              smoker: isSmokedChecked.toString(),
                              brandSmokedBefore: brandSmokedController.text,
                              brandSelectedNow: dtopDownChosen[3]);
                          await controller.setUsers(AddUserFormParameters(
                              userForm: userForm, token: widget.user.token!));
                          if (mounted) {
                            if (controller.requestState.value ==
                                RequestState.error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  GSnackBar(
                                          isSucess: false,
                                          body: controller.errorMessage.value)
                                      .get());
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        }
                      },
                      text: 'SUBMIT',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
