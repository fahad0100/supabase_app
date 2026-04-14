import 'package:fan_floating_menu/fan_floating_menu.dart';
import 'package:flutter/material.dart';

class FanFloatingMenuWidget extends StatelessWidget {
  const FanFloatingMenuWidget({super.key, required this.menu});
  final List<InoutFanFloatingMenuWidget> menu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FanFloatingMenu(
        toggleButtonColor: Theme.of(context).colorScheme.primary,
        fanMenuDirection: .rtl,
        menuItems: [
          ...List.generate(
            menu.length,
            (index) => FanMenuItem(
              onTap: menu[index].onTap,
              icon: Icons.edit_rounded,
              menuItemIconColor: Colors.black,
              title: menu[index].title,
              menuItemColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class InoutFanFloatingMenuWidget {
  final String title;
  final void Function() onTap;

  InoutFanFloatingMenuWidget({required this.title, required this.onTap});
}
