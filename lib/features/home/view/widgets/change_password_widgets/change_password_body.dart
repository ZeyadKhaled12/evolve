import 'package:flutter/material.dart';

import '../../../../../core/assets_manager.dart';
import '../../../../../core/general_widgets/g_widget_button.dart';
import '../../../../../core/general_widgets/g_widget_text_field.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  final List<TextEditingController> controllers =
      List.generate(3, (index) => TextEditingController());

  final List<bool> errors = List.generate(3, (index) => false);

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
                    'Change Password',
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
                      isPassword: true,
                      hintText: 'Old password*'),
                  GWidgetTextField(
                      controller: controllers[1],
                      isError: errors[1],
                      isPassword: true,
                      hintText: 'New password*'),
                  GWidgetTextField(
                      controller: controllers[2],
                      isError: errors[2],
                      isPassword: true,
                      hintText: 'Confirm password*'),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 25,
                        top: MediaQuery.of(context).size.height * 1 / 8),
                    child: GWidgetButton(
                      height: 69,
                      onPressed: () {
                        for (int i = 0; i < errors.length; i++) {
                          setState(() {
                            errors[i] = controllers[i].text.isEmpty;
                          });
                        }
                        if (!errors.contains(true)) {}
                      },
                      text: 'SUBMIT',
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
