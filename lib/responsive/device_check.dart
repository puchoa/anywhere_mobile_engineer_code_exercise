import 'package:anywhere_code_exercise/responsive/dimensions.dart';
import 'package:flutter/material.dart';

class DeviceCheck extends StatelessWidget {
  const DeviceCheck(
      {super.key, required this.mobileBody, required this.tabletBody});

  final Widget mobileBody;
  final Widget tabletBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var shortestSide = MediaQuery.of(context).size.shortestSide;
      if (shortestSide < mobileWidth) {
        return mobileBody;
      } else {
        return tabletBody;
      }
    });
  }
}
