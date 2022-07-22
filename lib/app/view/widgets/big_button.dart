import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
    required this.icon,
    required this.size,
    this.radius = 10.0,
  });
  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;
  final double radius;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 50,
              ),
            ),
            Flexible(
              child: Text(text),
            )
          ],
        ),
      ),
    );
  }
}
