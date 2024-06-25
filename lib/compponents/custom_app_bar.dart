import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String back;
  final Widget? leading;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.back,
    this.leading,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.orange, // Set the background color here
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: w * 0.06,
          letterSpacing: 2,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: leading ?? (back.isNotEmpty ? const BackButton(color: Colors.white) : null),
    );
  }
}
