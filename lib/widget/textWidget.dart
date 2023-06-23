import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {
  TextWidget({
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.align,
  });
  final text;
  final size;
  final color;
  final weight;
  final align;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
