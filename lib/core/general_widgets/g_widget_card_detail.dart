import 'package:flutter/material.dart';
import 'package:tdh_event/core/assets_manager.dart';
import '../../features/home/models/user_form.dart';

class GWidgetCardDetail extends StatelessWidget {
  const GWidgetCardDetail({super.key, required this.userModel});
  final UserForm userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (userModel.fName != null)
            TitleValueWidget(
                iconData: Icons.person,
                title: 'Full name',
                value: '${userModel.fName} ${userModel.lName}'),
          if (userModel.email != null)
            TitleValueWidget(
                iconData: Icons.email, title: 'Email', value: userModel.email),
          if (userModel.outletName != null)
            TitleValueWidget(
                iconData: Icons.circle,
                title: 'Outlet name',
                value: userModel.outletName),
          if (userModel.outletId != null)
            TitleValueWidget(
                iconData: Icons.circle,
                title: 'Outlet id',
                value: userModel.outletId),
          if (userModel.retailLocation != null)
            TitleValueWidget(
                iconData: Icons.location_history_rounded,
                title: 'Retail location',
                value: userModel.retailLocation),
          if (userModel.mobile != null)
            TitleValueWidget(
                iconData: Icons.phone_android,
                title: '${userModel.countryCode} Phone number',
                value: userModel.mobile),
          if (userModel.nationality != null)
            TitleValueWidget(
                iconData: Icons.location_on,
                title: 'Nationality',
                value: userModel.nationality),
          if (userModel.city != null)
            TitleValueWidget(
                iconData: Icons.location_city,
                title: 'City',
                value: userModel.city),
          if (userModel.age != null)
            TitleValueWidget(
                iconData: Icons.date_range, title: 'Age', value: userModel.age),
          if (userModel.giftReceived != null)
            TitleValueWidget(
                iconData: Icons.card_giftcard,
                title: 'Gift Received',
                value: userModel.giftReceived),
          if (userModel.refusal != null)
            TitleValueWidget(
                iconData: Icons.question_mark,
                title: 'Refusal reason',
                value: userModel.refusal),
          if (userModel.smoker != null)
            TitleValueWidget(
                checkedTrue: bool.parse(userModel.smoker!),
                title: 'I am somker'),
          if (userModel.smoker != null)
            if (bool.parse(userModel.smoker!))
              Column(
                children: [
                  TitleValueWidget(
                      iconData: Icons.smoke_free,
                      title: 'Brand Somked Before',
                      value: userModel.brandSmokedBefore),
                  TitleValueWidget(
                      iconData: Icons.smoking_rooms,
                      title: 'Brand Somked Now',
                      value: userModel.brandSelectedNow),
                ],
              )
        ],
      ),
    );
  }
}

class TitleValueWidget extends StatelessWidget {
  const TitleValueWidget(
      {super.key,
      this.iconData,
      required this.title,
      this.value,
      this.checkedTrue});
  final IconData? iconData;
  final String title;
  final String? value;
  final bool? checkedTrue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          checkedTrue != null
              ? Icon(
                  checkedTrue! ? Icons.check : Icons.close,
                  size: 29,
                  color: checkedTrue! ? Colors.green : Colors.red,
                )
              : Icon(iconData, size: 20),
          const Padding(padding: EdgeInsets.only(right: 20)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: FontsAssets.gotham,
                    fontWeight: FontWeight.w800),
              ),
              if (value != null)
                const Padding(padding: EdgeInsets.only(bottom: 5)),
              if (value != null)
                Text(
                  value!,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.5,
                      fontFamily: FontsAssets.gotham,
                      fontWeight: FontWeight.w800),
                )
            ],
          )
        ],
      ),
    );
  }
}
