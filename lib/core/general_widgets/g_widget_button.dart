import 'package:flutter/material.dart';

import '../assets_manager.dart';

class GWidgetButton extends StatelessWidget {
  const GWidgetButton(
      {super.key,
      this.width = 140,
      this.height = 80,
      this.marginLef = 50,
      this.fontSize = 32,
      required this.text,
      required this.onPressed,
      this.isLoading = false});
  final double width;
  final double height;
  final double marginLef;
  final double fontSize;
  final String text;
  final Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
        : GestureDetector(
            onTap: onPressed,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: marginLef),
                  width: width,
                  height: height,
                  transform: Matrix4.skewX(-.6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.black,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontFamily: FontsAssets.alternategot1D,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: fontSize),
                ),
              ],
            ),
          );
  }
}
