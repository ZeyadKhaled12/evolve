import 'package:flutter/material.dart';
import 'package:tdh_event/features/auth/models/user/user.dart';

import '../../../../../core/general_widgets/g_widget_card_detail.dart';

class ProfileWidgetCardDetail extends StatelessWidget {
  const ProfileWidgetCardDetail({super.key, required this.user});
  final User user;

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
          if (user.details?.name != null)
            TitleValueWidget(
                iconData: Icons.person,
                title: 'Full name',
                value: user.details!.name),
          if (user.details?.email != null)
            TitleValueWidget(
                iconData: Icons.email,
                title: 'Email',
                value: user.details!.email),
          if (user.details?.phone != null)
            TitleValueWidget(
                iconData: Icons.phone_android,
                title: 'Phone number',
                value: user.details!.phone),
          if (user.details?.role != null)
            TitleValueWidget(
                iconData: Icons.work, title: 'Role', value: user.details!.role),
        ],
      ),
    );
  }
}
