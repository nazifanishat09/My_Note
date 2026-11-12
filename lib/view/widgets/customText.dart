import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key, required this.title, this.textColor, this.fontS, this.fontW, this.textAlign,
  });
  final String  title;
  final Color? textColor;
  final double? fontS;
  final FontWeight? fontW;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(title,textAlign: textAlign
      ,style: TextStyle(
      color: textColor,fontSize: fontS,fontWeight: fontW,
    ),);
  }
}
