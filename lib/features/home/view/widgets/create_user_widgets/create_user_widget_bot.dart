import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tdh_event/core/dummy_data.dart';

import '../../../../../core/general_widgets/g_widget_country_code.dart';
import '../../../../../core/general_widgets/g_widget_drop_down.dart';
import '../../../../../core/general_widgets/g_widget_text_field.dart';
import 'create_user_widget_checked.dart';

class CreateUserWidgetBot extends StatelessWidget {
  const CreateUserWidgetBot(
      {super.key,
      required this.onChangedFuns,
      required this.errors,
      required this.numberController,
      required this.isSmokedChecked,
      required this.onCheckedFun,
      required this.onChanged,
      required this.brandSmokedController});
  final List<Function(dynamic value)> onChangedFuns;
  final List<bool> errors;
  final TextEditingController numberController;
  final TextEditingController brandSmokedController;
  final bool isSmokedChecked;
  final Function() onCheckedFun;
  final Function(CountryCode value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GWidgetCountryCode(
          controller: numberController,
          onChanged: onChanged,
          isError: errors[0],
        ),
        GWidgetDropDown(
          items: DummyData.nationality,
          isError: errors[1],
          onChanged: onChangedFuns[0],
          title: 'Nationality',
        ),
        GWidgetDropDown(
          items: DummyData.city,
          isError: errors[2],
          onChanged: onChangedFuns[1],
          title: 'City*',
        ),
        GWidgetDropDown(
          items: DummyData.age,
          isError: errors[3],
          onChanged: onChangedFuns[2],
          title: 'Age*',
        ),
        CreateUserWidgetChecked(
          isPicked: isSmokedChecked,
          onCheckedFun: onCheckedFun,
        ),
        if (isSmokedChecked)
          Column(
            children: [
              GWidgetTextField(
                  controller: brandSmokedController,
                  isError: errors[4],
                  hintText: 'Brand Smoked Before*'),
              GWidgetDropDown(
                items: DummyData.smokeDavidoff,
                isError: errors[5],
                onChanged: onChangedFuns[3],
                title: 'Brand selected*',
              ),
            ],
          )
      ],
    );
  }
}
