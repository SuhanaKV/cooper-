import 'package:cooper/utils/app_colors.dart';
import 'package:cooper/utils/dimensions.dart';
import 'package:cooper/widgets/my_text.dart';
import 'package:flutter/material.dart';

Widget welcomeText({
  String? text1,
  String? text2
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [ 
    myText(text: text1, size: Dimensions.txt40, weight: FontWeight.w500),
    SizedBox(height: Dimensions.height4 ,),
    myText(text: text2, size: Dimensions.txt16, color: AppColors.grey,weight: FontWeight.w500),
  ],);
}