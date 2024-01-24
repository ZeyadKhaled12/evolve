import 'package:flutter/material.dart';

import '../assets_manager.dart';

class GSnackBar {
  final String body;
  final bool isSucess;

  GSnackBar({required this.body, required this.isSucess});

  SnackBar get() => SnackBar(
        padding: const EdgeInsets.all(10),
        elevation: 1,
        backgroundColor: isSucess ? const Color(0XFF4DAE50) : Colors.red[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        behavior: SnackBarBehavior.floating,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isSucess ? 'Success' : 'Error',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: FontsAssets.gotham,
                    fontWeight: FontWeight.w800,
                    fontSize: 15)),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            Text(body,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: FontsAssets.gotham))
          ],
        ),
      );
}
