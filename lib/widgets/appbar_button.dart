import 'package:cooper/utils/app_colors.dart';
import 'package:cooper/utils/dimensions.dart';
import 'package:flutter/material.dart';

Widget appbarButton({
  IconData? icon,
  double? radius,
  Color? backColor= AppColors.background,
  Color? iconColor,
  Function()? onTap
}){
  return InkWell(
    onTap: onTap,
    child: CircleAvatar(
      radius: radius ?? Dimensions.radius30,
      backgroundColor:backColor,
      child: Icon(icon, size: Dimensions.txt32, color: iconColor,),),
  );
}