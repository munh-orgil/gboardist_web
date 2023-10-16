import 'package:core_control_panel/layout/sidebar_system.dart';
import 'package:flutter/material.dart';

class ProfileLayout extends StatelessWidget {
  ProfileLayout({super.key, required this.child});
  final Widget child;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(
        width: 360,
        child: Row(
          children: <Widget>[
            SideBarSystem(),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SideBarSystem(),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                // padding: const EdgeInsets.symmetric(horizontal: 150),
                child: child,
              ),
            ],
          );
        }),
      ),
    );
  }
}
