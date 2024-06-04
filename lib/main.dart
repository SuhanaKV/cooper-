//import 'package:cooper/routes/route_helper.dart';
import 'package:cooper/view/chat_screen.dart';
import 'package:cooper/view/home.dart';
import 'package:cooper/view/plan_screen.dart';
import 'package:flutter/material.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      //home: const Home(),
      routes: {
      '/': (context) => Home(),
      '/chat': (context) => ChatScreen(),
      '/plan': (context) => PlanScreen(),
    },
    );
  }
}

