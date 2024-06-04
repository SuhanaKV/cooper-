import 'dart:core';

import 'package:flutter/material.dart';

//import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = 731.42;//Get.context!.height; //731.42
  static double screenWidth = 411.42;//Get.context!.width; //411.42
  static double averageScreen = (screenHeight + screenWidth) / 2;
  //average 571.42
  
  Dimensions(BuildContext context){
   screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    averageScreen = (screenHeight + screenWidth) / 2; 
  }



  //radius
  static double radius15   = averageScreen / 38.09;
  static double radius12   = averageScreen / 47.61;
  static double radius25 = averageScreen / 22.85;
  static double radius30 = averageScreen / 19.04;
  static double radius20 = averageScreen / 28.57;
  static double radius18   = averageScreen / 31.74;

  //padding
   static double padding10 = averageScreen / 57.14;
   static double padding16 = averageScreen / 35.71;
   static double padding5 = averageScreen / 114.28;
  

  //width
  static double width6 = screenWidth / 68.57;
  static double width50 = screenWidth / 8.22;
  static double width120 = screenWidth / 3.42;
  static double width10 = screenWidth / 41.14;
  static double width80 = screenWidth / 5.14;
  static double width8 = screenWidth / 51.42;
  static double width40 = screenWidth / 10.28;
  static double width15 = screenWidth / 27.42;
  static double width70 = screenWidth / 5.87;
  static double width400 = screenWidth / 1.02;

  
  

  //height
  static double height4 = screenHeight /182.85 ;
  static double height8 = screenHeight / 91.42;
  static double height6 = screenHeight / 121.90;
  static double height12 = screenHeight / 60.95;
  static double height150 = screenHeight / 4.87;
  static double height30 = screenHeight / 24.38;
  static double height20 = screenHeight / 36.57;
  static double height95 = screenHeight / 7.69;
  static double height60 = screenHeight / 12.19;
  static double height15 = screenHeight / 48.76;
  static double height300 = screenHeight / 2.43;
  static double height280 = screenHeight / 2.5;
  static double height25 = screenHeight / 29.25;
  static double height250 = screenHeight / 2.92;
  static double height110 = screenHeight / 6.64;
  static double height90 = screenHeight / 8.12;
  static double height400 = screenHeight / 1.82;

  

  //txt
  static double txt40 = averageScreen / 14.28;
  static double txt15 = averageScreen / 38.09;
  static double txt16 = averageScreen / 35.71;
  static double txt18 = averageScreen / 31.74;
  static double txt32 = averageScreen / 17.85;
  static double txt22 = averageScreen / 25.97;
  static double txt20 = averageScreen / 28.57;
  static double txt25 = averageScreen / 22.85;

 
  
}
