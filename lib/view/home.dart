import 'package:cooper/utils/app_colors.dart';
import 'package:cooper/utils/dimensions.dart';
import 'package:cooper/widgets/container.dart';
import 'package:cooper/widgets/curved_text.dart';
import 'package:cooper/widgets/logo.dart';
import 'package:cooper/widgets/profile.dart';
import 'package:cooper/widgets/my_text.dart';
import 'package:cooper/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({ super.key });

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {
  List<String> list=["What is a wild animal?", "Scanning images", "Analysis my dribble shot", "How show the prototype figma",
   "What is a wild animal?", "Scanning images", "Analysis my dribble shot", "How show the prototype figma"];

   appBar(){
  return Padding(
    padding:  EdgeInsets.all(Dimensions.padding16),
    child: Row(children: [ 
      logo(Dimensions.radius20),
      const Spacer(),
      profile(Dimensions.radius25, image: "assets/images/profile.jpeg")
    ],),
  );
  
}

Widget iconCircle({
  double? radius,
  Color? color1,
  Color? iconColor,
  IconData? icon,

}){
  return CircleAvatar(
          radius: radius,
          backgroundColor: color1,
        child: Icon(icon, color: iconColor,),
        );
}

Widget cooperOpButton({
  IconData? icon,
  String? text1,
  String? text2,
  Color? color1,
  Color? color2,
  double? height,
  Color? text1Color,
  Color? iconColor

}){
  return InkWell(
    onTap: (){
      Get.toNamed('/chat');
    },
    child: container(
      radius: Dimensions.radius25,
        height: height,
      color: color2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width15, vertical: Dimensions.height15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [ 
            iconCircle(radius:  Dimensions.radius25, 
            color1: color1,
            iconColor: iconColor,
            icon: icon),

          text2!= null
          ? const Spacer() : SizedBox(height:  Dimensions.height6,),
          myText(text: text1, size: text2!= null ?  Dimensions.txt22 : Dimensions.txt18, color: text1Color, weight: text2!= null ? FontWeight.bold : FontWeight.w500 ),
          text2 != null
          ? SizedBox(height: Dimensions.height6,) : container(),
          text2 != null
          ? myText(text: text2, size: 16, color: AppColors.grey) : container()
        ],),
      ),
    ),
  );
}

Widget cooperOptions(){
  return container(
    height: Dimensions.height300,
        width: Get.width,
    child: Stack(
      children: [ Positioned(
        top: Dimensions.height6,
        right: 0,
        left: 0,
        child: container(height: Dimensions.height280,
        width: Get.width,
        child: Row(
          children: [ 
          Expanded(
            flex: 1,
            child:  cooperOpButton(
            height: Get.height,
          color1: AppColors.lightPurple,
          color2: AppColors.darkPurple,
            icon: Icons.mic_none_outlined, text1: "Talk with\nCooper", text2: "Let's try it now"), ),
          SizedBox(width: Dimensions.width8,),
          Expanded(
            flex: 1,
            child: Column(children: [ 
            Expanded(
              child: cooperOpButton(icon: Icons.chat_bubble_outline,
              text1: "New chat",
              color1: AppColors.lightYellow,
              color2: AppColors.darkYellow,),
            ),
            SizedBox(height: Dimensions.height8,),
            Expanded(
              child: cooperOpButton(icon: Icons.camera_alt_outlined,
              text1: "Search by\nimage",
              iconColor: AppColors.white,
              text1Color: AppColors.white,
              color1: AppColors.lightBlack,
              color2: AppColors.darkBlack,),
            ),
          ],))
        ],)),
      ),
      Positioned(
        right: Dimensions.width6,
        
        child: container(
          radius: Dimensions.radius12,
          color: const Color.fromARGB(255, 255, 101, 101),
          width: Dimensions.width40,
          height: Dimensions.height25,
          child: Center(child: myText(text: "New", color: AppColors.white))))],
    ),
  );
}

Widget headingRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [ 
      myText(text: "Recent Search", weight: FontWeight.w500, size: Dimensions.txt22),
      myText(text: "See All", weight: FontWeight.w400, size: Dimensions.txt20, color: AppColors.grey),
  ],);
}

Widget searchList(){

  Widget searchItem({
    Color? color1,
    Color? iconColor,
    IconData? icon,
    String? text,
  }){
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.height8),
      child: container(
        radius: Dimensions.radius25,
        height: Dimensions.height60,
        width: Get.width,
        color: AppColors.background,
        child: Padding(
          padding: EdgeInsets.only(top: Dimensions.height8, bottom: Dimensions.height8, left: Dimensions.width8, right: Dimensions.width10),
          child: Row(children: [ 
            iconCircle(radius: Dimensions.radius20, color1: color1 , iconColor:iconColor, icon: icon ),
            SizedBox(width: Dimensions.width8,),
            myText(text: text, size: Dimensions.txt15),
            const Spacer(),
            Icon(Icons.more_horiz_rounded, size: Dimensions.txt32,)
          ],),)
        ),
    );
  }

  return ListView.builder(
    physics: const ScrollPhysics(),
    shrinkWrap: true,
    itemCount: list.length,
    itemBuilder: (context, index){
      return searchItem(
        color1: index == 0 || index ==  4 || index ==  7 || index ==  3
        ? AppColors.darkPurple 
        :  index == 1 || index ==  5
        ?  AppColors.darkBlack
        : index == 2 || index ==  6
        ? AppColors.darkYellow
        : null ,
        iconColor: index == 1 || index ==  5
        ?  AppColors.white
        : AppColors.darkBlack,
        icon: index == 0 || index ==  4 || index ==  7 || index ==  3
        ?   Icons.mic_none_outlined
        :  index == 1 || index ==  5
        ? Icons.camera_alt_outlined
        : index == 2 || index ==  6
        ?  Icons.chat_bubble_outline
        : null,
        text: list[index] ,
      );
    });
}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark
    ));
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [ 
            SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15, top: Dimensions.txt20, bottom: Dimensions.height15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPaint(
            size: Size(Dimensions.width400, Dimensions.height250),
            painter: CurvedLineAndTextPainter(),
          ),
                welcomeText(
                  text1: "Hello James",
                  text2: "Make your day easy with us"
                ),
                SizedBox(height: Dimensions.height8,),
                cooperOptions(),
                SizedBox(height: Dimensions.height30,),
                headingRow(),
                SizedBox(height: Dimensions.height20,),
                searchList(),
          
              ],),
            )
          ),
          Positioned(child: appBar())],
        )),
    );
  }
}