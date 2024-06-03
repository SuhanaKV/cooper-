import 'package:flutter/material.dart';

Widget profile(radius, {String? image}){
  return CircleAvatar(
    radius: radius,
    backgroundImage: AssetImage(image!),);
}