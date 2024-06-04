import 'package:cooper/utils/app_colors.dart';
import 'package:cooper/utils/dimensions.dart';
import 'package:cooper/widgets/appbar_button.dart';
import 'package:cooper/widgets/container.dart';
import 'package:cooper/widgets/curved_text.dart';
import 'package:cooper/widgets/my_text.dart';
import 'package:cooper/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class PlanScreen extends StatefulWidget {
const PlanScreen({ super.key });

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Widget proStack(){
    return container(
      height: Dimensions.height110,
      width: Dimensions.width120,
      child: Stack(
        alignment: Alignment.center,
        children: [ 
        Positioned(
          bottom: Dimensions.height12,
          child: Container(
            width: Dimensions.height90,
          height: Dimensions.height90,
          decoration: const BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle),
            child: Padding(
              padding:  EdgeInsets.all(Dimensions.padding16),
              child: Image.asset("assets/images/cooperblack.png", fit: BoxFit.fill,),
            ),
          ),
        ),
        
        Positioned(
          bottom: 0,
          child: container(
            radius: Dimensions.radius15,
            color: AppColors.darkPurple,
            child:  Padding(
              padding:  EdgeInsets.symmetric(vertical: Dimensions.height4, horizontal: Dimensions.width10),
              child: myText(text: "Pro", size: Dimensions.txt15),
            )))
      ],),
    );
  }

  Widget content(){
    
    Widget plans({
      Color? color,
      String? text,
      String? image
    }){
      return container(color: color,
      radius: Dimensions.radius25,
      width: MediaQuery.of(context).size.width,//Get.width,
      child: Padding(
        padding: EdgeInsets.all(Dimensions.padding10),
        child: Column(children: [ 
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
            CircleAvatar(radius: Dimensions.radius25,
      backgroundImage: AssetImage(image!),),
      SizedBox(width: Dimensions.width10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        myText(text: text, size: Dimensions.txt20, weight: FontWeight.w500),
        SizedBox(height: Dimensions.height6,),
        myText(text: "\$8.99/month", size: Dimensions.txt16, color: AppColors.grey, weight: FontWeight.w500),
      ],),
      const Spacer(),
      container(
        radius: Dimensions.radius20,
        border: Border.all(color: AppColors.darkBlack),
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width8, vertical: Dimensions.height4),
        child:  myText(text: "Free ads",
         weight: FontWeight.w400, size: Dimensions.txt16)))
          ],),

          Divider(height: Dimensions.height30,),
          Row(children: [ 
            Icon(Icons.check_circle, size: Dimensions.txt22,),
            SizedBox(width: Dimensions.width8,),
            myText(text: "Chat unlimited", size: Dimensions.txt16, weight: FontWeight.w500),
            SizedBox(width: Dimensions.width15,),
            Icon(Icons.check_circle, size: Dimensions.txt22,),
            SizedBox(width: Dimensions.width8,),
            myText(text: "Notify Automatic", size: Dimensions.txt16, weight: FontWeight.w500),
          ],)
        ],),)
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(children: [ 
        CustomPaint(
            size: Size(Dimensions.width400, Dimensions.height250),
            painter: CurvedLineAndTextPainter(),
          ),
        proStack(),
        SizedBox(height: Dimensions.height8,),
        welcomeText(text1: "Cooper+ plans", 
        text2: "Try unlimited features with cooper+"),
        SizedBox(height: Dimensions.height30,),
        plans(color: AppColors.darkPurple, text: "Monthly Plan", image: "assets/images/bluegradient.jpeg"),
        SizedBox(height: Dimensions.height8,),
        plans(color: AppColors.darkYellow, text: "Yearly Plan", image: "assets/images/yellowgradient.jpeg"),

      ],),
    );
  }

  Widget button(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkBlack,
        surfaceTintColor: AppColors.darkBlack, ),
      onPressed: (){}, 
      child: myText(text: "Subscription", size: Dimensions.txt20, weight: FontWeight.w500, color: AppColors.white));
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: container(
          width: MediaQuery.of(context).size.width,//Get.width,
          height: MediaQuery.of(context).size.height,//Get.height,
          child: Stack(children: [ 
            content(),
            Positioned(
              top: Dimensions.height15,
              left: Dimensions.width15,
              child: appbarButton(
                onTap: () => Navigator.of(context).pop(),//Get.back(),
                backColor: AppColors.background,
              icon: Icons.keyboard_arrow_left),
            )
          
          ],),
        ),
        bottomNavigationBar: BottomAppBar(
          height: Dimensions.height90,
          color: AppColors.white,
          surfaceTintColor:  AppColors.white,
          child: button() ,)));
  }
}