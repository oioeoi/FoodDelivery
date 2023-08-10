import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String headAppBar;
  final Color? color;
  final Widget? icon_back;
  MyAppBar({required this.headAppBar, this.color, this.icon_back});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerRight, children: [
      Center(
        child: Text(
          headAppBar,
          style: TextStyle(
              color: color ?? Colors.green[500],
              fontFamily: 'font/SF-PRO.TTF',
              fontWeight: FontWeight.w900),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2),
        child: icon_back,
      )
    ]);
  }
}
