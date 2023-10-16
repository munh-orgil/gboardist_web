import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SidebarMenuItem {
  late String name;
  late String path;
  late IconData icon;

  SidebarMenuItem({
    required this.name,
    required this.path,
    required this.icon,
  });
}

final List<SidebarMenuItem> sidebarMenuItems = [
  SidebarMenuItem(
    name: 'Хэрэглэгч',
    icon: Icons.person_outlined,
    path: '/users',
  ),
  SidebarMenuItem(
    name: 'Байгууллага',
    icon: Icons.store_outlined,
    path: '/organizations',
  ),
  SidebarMenuItem(
    name: 'Төхөөрөмж',
    icon: Icons.phone_android_outlined,
    path: '/terminals',
  ),
  SidebarMenuItem(
    name: 'Тээврийн хэрэгсэл',
    icon: Icons.car_rental_outlined,
    path: '/vehicles',
  ),
  SidebarMenuItem(
    name: 'Файл',
    icon: Icons.compare_arrows_outlined,
    path: '/file',
  ),
  SidebarMenuItem(
    name: 'Resource',
    icon: Icons.source_outlined,
    path: '/resources',
  ),
  SidebarMenuItem(
    name: 'Хэрэглэгчийн эрх',
    icon: Icons.shield_outlined,
    path: '/roles',
  ),
  SidebarMenuItem(
    name: 'Сервис',
    icon: Icons.electrical_services_outlined,
    path: '/system-service',
  ),
  SidebarMenuItem(
    name: 'Лог',
    icon: Icons.info_outline,
    path: '/logs',
  ),
];

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade100
              : Colors.grey.shade900,
          height: constraints.maxHeight,
          width: 256,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: ListView.builder(
            itemCount: sidebarMenuItems.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuItem(
                title: sidebarMenuItems[index].name,
                path: sidebarMenuItems[index].path,
                icon: sidebarMenuItems[index].icon,
                press: () => QR.navigator
                    .replaceAllWithName(sidebarMenuItems[index].path),
              );
            },
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
    required this.path,
  }) : super(key: key);

  final String title, path;
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
    String? currentRouteName = QR.currentPath;
    return GestureDetector(
      onTap: widget.press,
      child: MouseRegion(
        onEnter: (_) => onEntered(true),
        onExit: (_) => onEntered(false),
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            color: isHovered || widget.path == currentRouteName
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 18),
              const SizedBox(width: 6),
              Text(
                widget.title,
                style: TextStyle(
                  color: theme.textTheme.displayLarge?.color,
                  fontWeight: widget.path == currentRouteName
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
