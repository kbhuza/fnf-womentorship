import 'package:flutter/material.dart';

class AppIconText extends StatefulWidget {
  final Icon icon;
  final Widget text;

  const AppIconText({super.key, required this.icon, required this.text});

  @override
  State<AppIconText> createState() => _AppIconTextState();
}

class _AppIconTextState extends State<AppIconText> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        widget.icon,
        const SizedBox( width: 4),
        widget.text
      ],
    );
  }
}