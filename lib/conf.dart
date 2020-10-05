import 'package:flutter/material.dart';
import 'package:mero_kotha/pages/login_signin.dart';
import 'package:mero_kotha/pages/room_search.dart';

import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/login_signup":
        return MaterialPageRoute(builder: (context) => LoginSigninPage());
      case "/room_search":
        return MaterialPageRoute(
            builder: (context) => RoomSearch(routeSettings.arguments));
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

const apiKey = "53465FDSFf##%#%%";
const baseUrl = "http://192.168.100.8:8080/";
const imageUrl = "http://192.168.100.8:8080";
