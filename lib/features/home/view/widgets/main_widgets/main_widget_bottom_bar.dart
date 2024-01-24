import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../../../core/utils/app_constance.dart';

class MainWidgetBottomBar extends StatelessWidget {
  const MainWidgetBottomBar(
      {super.key, required this.fun, required this.indexChosen});
  final Function(int index) fun;
  final int indexChosen;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 10,
        ),
        child: Container(
          height: AppConstance.heightOfBottomBar(context),
          width: double.infinity,
          color: const Color(0XFFADCFED).withOpacity(0.4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconWidget(
                index: 0,
                indexChosen: indexChosen,
                fun: fun,
                icon: Icons.group_outlined,
                iconChosen: Icons.group,
              ),
              IconWidget(
                index: 1,
                indexChosen: indexChosen,
                fun: fun,
                icon: Icons.home_outlined,
                iconChosen: Icons.home,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget(
      {super.key,
      required this.icon,
      required this.iconChosen,
      required this.fun,
      required this.index,
      required this.indexChosen});
  final IconData icon;
  final IconData iconChosen;
  final int index;
  final int indexChosen;
  final Function(int index) fun;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
            onPressed: () => fun(index),
            child: Center(
                child: Icon(
              index == indexChosen ? iconChosen : icon,
              color: Colors.black,
              size: 25,
            ))));
  }
}
