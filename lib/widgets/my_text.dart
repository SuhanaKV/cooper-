import 'package:cooper/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget myText({
  String? text,
  double? size,
  FontWeight? weight,
  Color? color= AppColors.darkBlack
}){
  return Text(text!,
   style: TextStyle(
    color: color,
    fontSize: size,
    fontWeight: weight),);
}