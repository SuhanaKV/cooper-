import 'package:flutter/material.dart';

Widget container({
  double? width, 
  double? height, 
  double? radius,
  Color? color,
  List<BoxShadow>? shadow,
  Widget? child,
  Border? border
  }){
  return Container(
    
    width: width,
    height: height,
    decoration: BoxDecoration(
      border: border ,
      boxShadow: shadow,
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 0.0))),
    child: child,);
}