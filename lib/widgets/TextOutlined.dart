import 'package:flutter/material.dart';

class TextOutlined extends StatelessWidget {
  final String text;
  final double fontSize;
  final double letterSpacing;
  final double strokeWidth;
  final Color strokeColor;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const TextOutlined({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.strokeWidth,
    required this.letterSpacing,
    required this.color,
    required this.strokeColor,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            overflow: TextOverflow.clip,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontFamily: 'Folks',
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            overflow: TextOverflow.clip,
            letterSpacing: letterSpacing,
            color: color,
            fontWeight: fontWeight,
            fontFamily: 'Folks',
          ),
        ),
      ],
    );
  }
}
