import 'package:flutter/material.dart';
import 'package:trailing_flutter/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double size;
  final String? text;
  final IconData? icon;
  final bool? isIcon;

  const AppButtons({
    Key? key,
    this.text,
    this.icon,
    this.isIcon = false,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: 1),
        color: backgroundColor,
      ),
      child: isIcon == false ? Center(child: AppText(text: text!, color: color)) : Icon(icon, color: color),
    );
  }
}
