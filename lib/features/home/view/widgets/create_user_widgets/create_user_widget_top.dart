import 'package:flutter/material.dart';

import '../../../../../core/assets_manager.dart';
import '../../../../../core/general_widgets/g_widget_text_field.dart';

class CreateUserWidgetTop extends StatelessWidget {
  const CreateUserWidgetTop(
      {super.key, required this.errors, required this.controllers});
  final List<bool> errors;
  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.only(bottom: 26)),
        const Text(
          'Create User',
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
            hintText: 'First name*'),
        GWidgetTextField(
            controller: controllers[1],
            isError: errors[1],
            hintText: 'Last name*'),
        GWidgetTextField(
            controller: controllers[2],
            isError: errors[2],
            hintText: 'Email address*'),
        // GWidgetTextField(
        //     controller: controllers[3],
        //     isError: errors[3],
        //     hintText: 'Outlet name*'),
        // GWidgetTextField(
        //     controller: controllers[4],
        //     isError: errors[4],
        //     hintText: 'Outlet ID*'),
        // GWidgetTextField(
        //     controller: controllers[5],
        //     isError: errors[5],
        //     hintText: 'Retail location*'),
      ],
    );
  }
}
