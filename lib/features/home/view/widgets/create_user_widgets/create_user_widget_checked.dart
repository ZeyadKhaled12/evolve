import 'package:flutter/material.dart';

import '../../../../../core/assets_manager.dart';

class CreateUserWidgetChecked extends StatelessWidget {
  const CreateUserWidgetChecked(
      {super.key, required this.isPicked, required this.onCheckedFun});
  final bool isPicked;
  final Function() onCheckedFun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: onCheckedFun,
              icon: Icon(
                isPicked ? Icons.check_box : Icons.check_box_outline_blank,
                size: 28,
                color: isPicked ? Colors.green : Colors.grey,
              )),
          const Padding(padding: EdgeInsets.only(right: 10)),
          const Text('I am smoker',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontsAssets.gotham,
                  fontSize: 15)),
        ],
      ),
    );
  }
}
