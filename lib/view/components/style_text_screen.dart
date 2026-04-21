import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.textAlign,
      });

  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.titleLarge;

    return Text(
      text,
      textAlign: textAlign,
      style: baseStyle?.copyWith(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 25,
      ),
    );
  }
}
