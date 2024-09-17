import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color selectedColor;
  final Color unselectedColor;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: isSelected ? selectedColor : unselectedColor,
      ),
    );
  }
}