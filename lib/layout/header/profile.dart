// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../helpers/storage/storage.dart';

class ProfileMenuItem {
  late String name;
  late IconData icon;
  late VoidCallback? fn;
  late String path;

  ProfileMenuItem({
    required this.name,
    required this.icon,
    this.fn,
    required this.path,
  });
}

final List<ProfileMenuItem> profileDropDownList = [
  // ProfileMenuItem(
  //   name: "Хувийн хэрэг",
  //   icon: Icons.account_circle_outlined,
  //   path: '/profile',
  // ),
  // ProfileMenuItem(
  //   name: "Тохиргоо",
  //   icon: Icons.settings_outlined,
  //   path: '/settings',
  // ),
  ProfileMenuItem(
    name: "Гарах",
    icon: Icons.logout_outlined,
    path: '/login',
    fn: () => {
      StorageService.clear(),
    },
  ),
];

class ProfileDropdownButton extends StatelessWidget {
  const ProfileDropdownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ProfileMenuItem>(
      elevation: 8,
      position: PopupMenuPosition.under,
      tooltip: "",
      itemBuilder: (BuildContext context) {
        return profileDropDownList.map<PopupMenuEntry<ProfileMenuItem>>(
          (ProfileMenuItem item) {
            return PopupMenuItem(
              value: item,
              child: MenuItem(name: item.name, icon: item.icon, fn: item.fn),
            );
          },
        ).toList();
      },
      onSelected: (ProfileMenuItem item) {
        // ignore: unnecessary_null_comparison
        if (item.path == null) {
          item.fn!();
        } else {
          QR.navigator.pushName(item.path);
        }
      },
      child: const Icon(
        Icons.person,
        size: 32,
        color: Colors.white,
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.name,
    required this.icon,
    this.fn,
  });
  final String name;
  final IconData icon;
  final VoidCallback? fn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(width: 6),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
