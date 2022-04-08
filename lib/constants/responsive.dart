import 'package:flutter/material.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width >= 650 &&
    MediaQuery.of(context).size.width < 840;

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 840;

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabbody;
  final Widget desktopBody;

  ResponsiveLayout(
      {required this.mobileBody,
      required this.tabbody,
      required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile(context)) {
          return mobileBody;
        } else if (isTab(context)) {
          return tabbody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
