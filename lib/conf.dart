import 'package:flutter/material.dart';
import 'package:mero_kotha/model/facilities.dart';
import 'package:mero_kotha/pages/contactUsPage.dart';
import 'package:mero_kotha/pages/errorPage.dart';
import 'package:mero_kotha/pages/login_signin.dart';
import 'package:mero_kotha/pages/myRent.dart';
import 'package:mero_kotha/pages/propertyDescription.dart';
import 'package:mero_kotha/pages/propertySelection.dart';
import 'package:mero_kotha/pages/register.dart';
import 'package:mero_kotha/pages/search.dart';
import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/login_signup":
        return MaterialPageRoute(builder: (context) => LoginSigninPage());
      case "/register":
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case "/search":
        return MaterialPageRoute(
            builder: (context) => Search(routeSettings.arguments));
      case "/myrent":
        return MaterialPageRoute(builder: (context) => MyRentPage());
      case "/contact_us":
        return MaterialPageRoute(builder: (context) => ContactUsPage());
      case "/property_selection":
        return MaterialPageRoute(builder: (context) => PropertySelectionPage());
      case "/property_description":
        return MaterialPageRoute(
          // settings: routeSettings,
          builder: (context) => PropertyDescriptionPage(
            routeSettings.arguments,
          ),
        );
      case "/error":
        return MaterialPageRoute(builder: (context) => ErrorPage());
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

// List<Map<String, dynamic>> drawerCategory = [
//   {
//     "title": "My Rent",
//     "icon": Icon(IconData(57360, fontFamily: 'MaterialIcons')),
//   },
//   {
//     "title": "Home",
//     "icon": Icon(Icons.home),
//   },
//   {
//     "title": "Our Story",
//     "icon": Icon(Icons.pages),
//   },
//   {"title": "Contact Us", "icon": Icon(Icons.phone_in_talk)},
//   {
//     "title": "Logout",
//     "icon": Icon(
//       AppIcons.login,
//       size: 20,
//     ),
//   },
// ];
// Color baseColor = Color(0xFFECF0F3);
List<Map<String, dynamic>> roomFacilities = [
  {"title": "wifi", "icon": Icon(Icons.wifi)},
  {"title": "wifi", "icon": Icon(Icons.wifi)},
  {"title": "wifi", "icon": Icon(Icons.wifi)},
  {"title": "wifi", "icon": Icon(Icons.wifi)},
  {"title": "wifi", "icon": Icon(Icons.wifi)},
  {"title": "wifi", "icon": Icon(Icons.wifi)}
];
const maxMobileNumbers = 3;
Color baseColor = Color(0xFFECF0F3);
Color backgroundColor = Color(0xFF193566);
double appBarHeight = 60.0;
const apiKey = "53465FDSFf##%#%%";
const baseUrl = "http://192.168.1.68:8080/";
const imageUrl = "http://192.168.1.68:8080";
const imageLink = "http://192.168.1.68:8080/";
// const baseUrl = "http://45.76.147.177:8080/";
// const imageUrl = "http://45.76.147.177:8080";
List<Facilities> listFacilities = [
  Facilities(
      name: "Wifi",
      modelName: "hasInternet",
      icon: Icon(Icons.wifi),
      value: false,
      departments: ["room", "shoooter", "hostels"]),
  Facilities(
      name: "Parking",
      modelName: "hasParking",
      icon: Icon(Icons.local_parking),
      value: false,
      departments: ["room", "hostels"]),
  Facilities(
      name: "Bed Rooms",
      modelName: "numberOfRooms",
      icon: Icon(
        Icons.branding_watermark,
      ),
      value: 0,
      departments: ["shoooter"]),
  Facilities(
      name: "Facing",
      modelName: "facing",
      icon: Icon(Icons.directions),
      value: ShutterDirection.East,
      departments: ["shoooter"]),
];
enum ShutterDirection { East, West }

//AIzaSyBLbiDhIeEFN5ElqJTO9pSJOBgHSfo0wKU
