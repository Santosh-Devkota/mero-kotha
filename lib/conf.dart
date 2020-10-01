import 'package:flutter/material.dart';
import 'package:mero_kotha/pages/room_search.dart';

import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/room_search":
        return MaterialPageRoute(builder: (context) => RoomSearch());
      case "/":
        return MaterialPageRoute(builder: (context) => HomeScreen());
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => Container(
            child: Text("404"),
          ),
        );
    }
  }
}

// Color baseColor = Color(0xFFECF0F3);
Color baseColor = Color(0xFFECF0F3);
Color backgroundColor = Color(0xFF193566);
const List<Map<String, String>> homePage = [
  {"categoryName": "ROOM", "image": "assets/icons/room.png"},
  {"categoryName": "FLAT", "image": "assets/icons/flat.png"},
  {"categoryName": "SHUTTER", "image": "assets/icons/shutter.png"},
  {"categoryName": "HELP", "image": "assets/icons/help.png"},
];

const apiKey = "53465FDSFf##%#%%";
const baseUrl = "http://192.168.100.8:8080/";
const imageUrl = "http://192.168.100.8:8080";
