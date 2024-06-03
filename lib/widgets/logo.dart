import 'package:cooper/utils/app_colors.dart';
import 'package:cooper/utils/dimensions.dart';
import 'package:cooper/widgets/container.dart';
import 'package:cooper/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget logo(radius){
  return InkWell(
     onTap: () => Get.toNamed('/plan'),
    child: container(height: Dimensions.height60,
    radius: Dimensions.radius30,
    color: AppColors.background,
    child: Padding(
      padding:  EdgeInsets.all(Dimensions.padding5),
      child: Row(children: [ 
        CircleAvatar(
          
          radius: radius,
        backgroundImage: const AssetImage("assets/images/cooper.jpeg",),
        ),
        SizedBox(width: Dimensions.width6,),
       myText(text: "Cooper 1.7", size: Dimensions.txt15, weight: FontWeight.w500),
       const SizedBox(width: 5,),
       Icon(Icons.keyboard_arrow_down, size: Dimensions.txt25, color: AppColors.darkBlack,)
      ],),
    )
    ),
  );
}