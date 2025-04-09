import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final double fontSize;
  final double? letterSpacing;
  final double? lineHeight;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Function()? onTap;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final List<Shadow>? shadows;

  const TextView({
    super.key,
    required this.text,
    this.textOverflow = TextOverflow.clip,
    this.textAlign = TextAlign.left,
    this.color,
    this.onTap,
    this.fontSize = 16.0,
    this.letterSpacing,
    this.lineHeight,
    this.textStyle,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.decoration,
    this.decorationStyle,
    this.shadows,
    this.decorationThickness,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
