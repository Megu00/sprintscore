import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textalign;
  final Color? backgroundcolor;
  final String ? fontFamily;
  const CustomText({
    Key? key,
    this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.textalign,
    this.backgroundcolor,
    this.fontFamily

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textalign,
      style: TextStyle(
        
        fontFamily: fontFamily,
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          backgroundColor: backgroundcolor),
    );
  }
}
