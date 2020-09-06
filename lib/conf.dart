import 'package:flutter/material.dart';

import 'main.dart';

class RouteGenerator{
  static Route<dynamic>  generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case "/":
      return MaterialPageRoute(builder: (context)=>HomeScreen());
      break;
      default:
      return MaterialPageRoute(builder: (context)=>Container(child: Text("404"),));
    }

  }
}