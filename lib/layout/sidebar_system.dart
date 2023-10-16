import 'package:core_control_panel/helpers/storage/storage.dart';
import 'package:core_control_panel/layout/sidebar_menu.dart';
import 'package:core_control_panel/main.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'header/profile.dart';

class SidebarSystemItem {
  late String name;
  late String path;
  late IconData icon;

  SidebarSystemItem({
    required this.name,
    required this.icon,
    required this.path,
  });
}

final List<SidebarSystemItem> sidebarSystemItems = [
  SidebarSystemItem(
    name: 'Үндсэн',
    icon: Icons.home_outlined,
    path: '/users',
  ),
  SidebarSystemItem(
    name: 'Хянах',
    icon: Icons.desktop_windows_outlined,
    path: '/organizations',
  ),
];

class SideBarSystem extends StatefulWidget {
  const SideBarSystem({
    Key? key,
  }) : super(key: key);

  @override
  State<SideBarSystem> createState() => _SideBarSystemState();
}

class _SideBarSystemState extends State<SideBarSystem> {
  final ScrollController scrollController = ScrollController();

  gg() {}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade100
              : Colors.grey.shade900,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          height: constraints.maxHeight,
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const ProfileDropdownButton(),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                height: sidebarSystemItems.length * 72,
                child: ListView.builder(
                  itemCount: sidebarSystemItems.length,
                  controller: scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuItem(
                      title: sidebarSystemItems[index].name,
                      icon: sidebarSystemItems[index].icon,
                      press: () => QR.navigator.replaceAllWithName(
                        sidebarMenuItems[index].path,
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  MyApp.themenotifier.value == ThemeMode.dark
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                  size: 24,
                ),
                onPressed: () {
                  MyApp.themenotifier.value =
                      MyApp.themenotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                },
                tooltip: 'Dark mode',
              ),
              IconButton(
                iconSize: 24,
                onPressed: () {
                  QR.navigator.pushName('/login');
                  StorageService.clear();
                },
                icon: const Icon(Icons.logout_outlined),
                tooltip: 'Системээс гарах',
              ),
            ],
          ),
        );
      },
    );
  }
}

class MenuItem extends StatefulWidget {
  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;

  void onEntered(bool isHovered) {
    if (mounted) {
      setState(() {
        this.isHovered = isHovered;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: widget.press,
      child: MouseRegion(
        onEnter: (_) => onEntered(true),
        onExit: (_) => onEntered(false),
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            color: isHovered
                ? Theme.of(context).brightness == Brightness.light
                    ? const Color.fromRGBO(233, 232, 236, 1)
                    : const Color.fromARGB(255, 100, 100, 100)
                : Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          margin: const EdgeInsets.only(bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 24),
              const SizedBox(width: 6),
              Text(
                widget.title,
                style: TextStyle(
                  color: theme.textTheme.displayLarge?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
