// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RountedIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final Color shadowColor;
  final EdgeInsetsGeometry? padding;

  const RountedIconButton({
    Key? key,
    required this.icon,
    this.size = 60,
    this.color,
    this.shadowColor = const Color(0xffE125B0),
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            spreadRadius: 10,
            offset: const Offset(0, 0),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
