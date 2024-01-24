import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:tdh_event/core/general_widgets/g_widget_text_field.dart';

class GWidgetCountryCode extends StatelessWidget {
  const GWidgetCountryCode(
      {super.key,
      required this.controller,
      required this.isError,
      required this.onChanged});
  final TextEditingController controller;
  final bool isError;
  final Function(CountryCode value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 62.5,
          color: Theme.of(context).colorScheme.background,
          child: CountryCodePicker(
            onChanged: onChanged,
            initialSelection: 'SA',
            favorite: const ['SA', 'AE'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
          ),
        ),
        Expanded(
            child: GWidgetTextField(
                controller: controller,
                isNumber: true,
                isError: isError,
                hintText: 'Area code + mobile number*'))
      ],
    );
  }
}
