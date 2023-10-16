import 'package:core_control_panel/helpers/themes/color_scheme.dart';
import 'package:core_control_panel/main.dart';
import 'package:flutter/material.dart';

import 'header/profile.dart';
import 'sidebar_menu.dart';
import 'sidebar_system.dart';

class Layout extends StatelessWidget {
  Layout({super.key, required this.child});
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
            VerticalDivider(thickness: 1, width: 1),
            SidebarMenu(),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 850) {
              return Column(
                children: [
                  AppBar(
                    leading: IconButton(
                      onPressed: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu_outlined,
                        size: 24,
                        color: MyApp.themenotifier.value == ThemeMode.dark
                            ? Colors.white30
                            : Colors.white,
                      ),
                      tooltip: 'Цэс',
                    ),
                    actions: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ProfileDropdownButton(),
                      ),
                    ],
                    backgroundColor: MyApp.themenotifier.value == ThemeMode.dark
                        ? TColorScheme.darkScheme.primary
                        : TColorScheme.lightScheme.primary,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: child,
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SideBarSystem(),
                  const VerticalDivider(thickness: 1, width: 1),
                  const SidebarMenu(),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: child,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
