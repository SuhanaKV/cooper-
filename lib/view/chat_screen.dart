
import 'package:cooper/utils/app_colors.dart';
import 'package:cooper/utils/dimensions.dart';
import 'package:cooper/widgets/appbar_button.dart';
import 'package:cooper/widgets/container.dart';
import 'package:cooper/widgets/logo.dart';
import 'package:cooper/widgets/my_text.dart';
import 'package:cooper/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({ super.key });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller=TextEditingController();
  var _tapPosition=Offset.zero;

  void _getTapPosition(TapDownDetails tapPosition){
     final RenderBox referenceBox = context.findRenderObject() as RenderBox;
     setState(() {
       _tapPosition = referenceBox.globalToLocal(tapPosition.globalPosition);   // store the tap positon in offset variable
       print(_tapPosition);
     });
  }
   

  void _showContextMenu(BuildContext context) async {

    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();
    
    final result = await showMenu(
      constraints: BoxConstraints(minWidth: Dimensions.width70,maxWidth: Dimensions.width70),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radius30)),
      surfaceTintColor: AppColors.darkBlack,
      color: AppColors.darkBlack,
        context: context,
        position: RelativeRect.fromLTRB(Dimensions.width80, Dimensions.height400, Dimensions.width10, Dimensions.height8),//(80,400 ,10 ,30 ),
        
        items: [
          const PopupMenuItem(
            value: "voice",
            child: CircleAvatar(
             radius:  30,
              backgroundColor: AppColors.lightBlack,
              child: Icon(Icons.mic_none_outlined, size: 24, color: AppColors.white,),),
          ),
          const PopupMenuItem(
            padding: EdgeInsets.all(6),
            value: "image",
            child: CircleAvatar(
             radius:  30,
              backgroundColor: AppColors.lightBlack,
              child: Icon(Icons.camera_alt_outlined, size: 24, color: AppColors.white,),),
          ),
          const PopupMenuItem(
            padding: EdgeInsets.all(6),
            value: "chat",
            child: CircleAvatar(
             radius:  30,
              backgroundColor: AppColors.lightBlack,
              child: Icon(Icons.chat_bubble_outline, size: 24, color: AppColors.white,),),
          )
        ]);
    switch (result) {
      case 'voice':
        break;
      case 'image':
        Navigator.pop(context);
        break;
      case 'chat':
        Navigator.pop(context);
        break;
    }
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
    

  }

  Widget contentItem({
    bool? me
  }){

    Widget graphContainer(){
      return Padding(
        padding:  EdgeInsets.only(top: Dimensions.height8),
        child: container(
          color: AppColors.white,
          radius:  Dimensions.radius15, 
        child: Padding(
          padding: EdgeInsets.all( Dimensions.padding10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            myText(text: "2022", size:  Dimensions.txt18),
            SizedBox(height:  Dimensions.height6,),
            myText(text: "275.5 Million", size:  Dimensions.txt32, weight: FontWeight.w500),
            SizedBox(height:  Dimensions.height6,),
            container(
              height:  Dimensions.height150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index){
                  return Center(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(right:  Dimensions.width6),
                        child: container(
                          height: index==0 ? Dimensions.height60 : (60+(index*20.0)),
                          width: Dimensions.width50,
                          radius: Dimensions.radius25,
                          color: index%2 == 0 
                          ? AppColors.darkYellow
                          : AppColors.darkPurple
                          ),),
                    ),
                  );
                }),
            )
          ],),)),
      );
    }

    return Column(
      crossAxisAlignment: me ==  true
      ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [ 
      Row(
        mainAxisAlignment: me ==  true
      ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [ 
        profile(Dimensions.radius15, image: me == true
    ? "assets/images/profile.jpeg"
    : "assets/images/cooper.jpeg"),
        SizedBox(width: Dimensions.width6,),
        myText(text: me == true
    ? "Me"
    : "Cooper")
      ],),
      SizedBox(height: Dimensions.height8,),
      Padding(
        padding: EdgeInsets.only(left: me == true? Dimensions.width120 : 0.0, right: me == false? Dimensions.width120 : 0.0,),
        child: Container(
          decoration: BoxDecoration(color: me == true
            ? AppColors.darkPurple
            : AppColors.white,
            borderRadius: me == true
            ? BorderRadius.only(topLeft: Radius.circular(Dimensions.radius15), bottomLeft: Radius.circular(Dimensions.radius15), bottomRight: Radius.circular(Dimensions.radius15))
            : BorderRadius.only(topRight: Radius.circular(Dimensions.radius15), bottomLeft: Radius.circular(Dimensions.radius15), bottomRight: Radius.circular(Dimensions.radius15)) ),
            
            child: Padding(
        padding: EdgeInsets.all(Dimensions.padding10),
        child: myText(text: me == true
        ? "Provide statistics on the development of indonesian population"
        : "Well, here's the latest statical data on indonesia's  population"),), ),
      ),
    
    me == false
    ? graphContainer()
    : container(),
    
    SizedBox(height: Dimensions.height8,),
    myText(text: me == true
    ? "1 mins ago"
    : "Just now", size: Dimensions.txt15)
    ],);
  }

  Widget inputField(){
      return Padding(
        padding:  EdgeInsets.all(Dimensions.padding5),
        child: container(
          radius: Dimensions.radius30,
          color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height6),
          child: Row(children: [ 
            container(
              width: Get.width-120,
              child: TextField(controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Ask anything here...",
                hintStyle: TextStyle(
                  
                  fontSize: Dimensions.txt15,
                  fontWeight:  FontWeight.w400),
              ),),
            ),
            //myText(text: "Ask anything here...", size: Dimensions.txt15, weight: FontWeight.w400),
            const Spacer(),
            GestureDetector(
              onTapDown: (position){
                      _getTapPosition(position) ; 
                    },onLongPress: (){
                    _showContextMenu(context);   
                  },
              child: appbarButton(
                icon: Icons.add, radius: Dimensions.radius25, backColor: AppColors.darkPurple),
            )
          ],),)),
      );
    }

  
  Widget contents(){
    
    
    Widget listView(){
      return ListView.builder(
        padding: EdgeInsets.all(Dimensions.padding16),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index){
          switch(index){
            case 0:
             return Column(children: [ 
               container(
                shadow: [const BoxShadow(color: AppColors.grey,
                blurRadius: 4.0,
                offset: Offset(0, 5))],
                width: Dimensions.width80, 
               height: Dimensions.height30,
               radius: Dimensions.radius15,
               color: AppColors.white,
               child: Center(child: myText(text: "Today", size: Dimensions.txt16, weight: FontWeight.w400)) ),
               SizedBox(height: Dimensions.height8,),
               contentItem(me: true),
             ],);
            case 1:
             return contentItem(me: false);
            case 2:
             return Column(children: [ 
               container(
                shadow: [const BoxShadow(color: AppColors.grey,
                blurRadius: 4.0,
                offset: Offset(0, 5))],
                 width: Dimensions.width80, 
               height: Dimensions.height30,
               radius: Dimensions.radius15,
               color: AppColors.white,
               child: Center(child: myText(text: "Today", size: Dimensions.txt16, weight: FontWeight.w400)) ),
               SizedBox(height: Dimensions.height8,),
               contentItem(me: true),
             ],);
            case 3:
             return contentItem(me: false);
            
          }
          return null;
        });
    }

    return Padding(
      padding:  EdgeInsets.only(top:Dimensions.height20),
      child: Container(width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), topRight:  Radius.circular(Dimensions.radius20))),
      child: Stack(children: [ 
        listView(),
      ],)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white ,
          foregroundColor: AppColors.white ,
          leading: Padding(
            padding:  EdgeInsets.only(left: Dimensions.width8, top: Dimensions.height8),
            child: appbarButton(icon: Icons.keyboard_arrow_left,
             onTap:() => Get.back(),),
          ),
          actions: [ 
            const Spacer(),
            Padding(
              padding: EdgeInsets.only( top: Dimensions.height8),
              child: logo(Dimensions.radius18),
            ),
            SizedBox(width: Dimensions.width6,),
            Padding(
              padding: EdgeInsets.only(right: Dimensions.width8, top: Dimensions.height8),
              child: appbarButton(icon: Icons.more_horiz_rounded),
            )
          ] ,),
        body: contents(),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: BottomAppBar(
            height: Dimensions.height95,
            color: AppColors.background,
            surfaceTintColor:  AppColors.background,
            child: inputField() ,),
        )
        ),
    );
  }
}