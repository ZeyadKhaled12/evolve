import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tdh_event/core/assets_manager.dart';

class GWidgetTextField extends StatelessWidget {
  const GWidgetTextField(
      {super.key,
      required this.controller,
      this.isEnable = true,
      this.isPassword = false,
      required this.isError,
      required this.hintText,
      this.isNumber = false});
  final TextEditingController controller;
  final bool isEnable;
  final bool isPassword;
  final bool isError;
  final String hintText;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : null,
        inputFormatters: isNumber
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : null,
        cursorColor: Colors.black,
        obscureText: isPassword,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.black, fontSize: 19),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          contentPadding:
              const EdgeInsets.only(bottom: 20, top: 20, left: 10, right: 10),
          fillColor: Theme.of(context).colorScheme.background,
          hintText: hintText,
          hintStyle: const TextStyle(
              fontFamily: FontsAssets.gotham,
              color: Colors.black,
              fontSize: 15),
          focusedErrorBorder: isError ? outLine(Colors.red) : null,
          errorBorder: isError ? outLine(Colors.red) : null,
          errorText: isError ? 'This field required' : null,
          errorStyle: isError
              ? const TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontFamily: FontsAssets.gotham)
              : null,
          enabled: isEnable,
          // enabledBorder: outLine(Colors.grey[200]!),
          // focusedBorder: outLine(Colors.grey[200]!),
          // disabledBorder: outLine(Colors.grey[200]!),
        ),
      ),
    );
  }
}

OutlineInputBorder outLine(Color borderColor) => OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 2),
      borderRadius: BorderRadius.circular(5),
    );
