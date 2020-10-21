import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/authbloc.dart';
import 'package:mero_kotha/pages/contactUsPage.dart';
import 'package:mero_kotha/pages/errorPage.dart';
import 'package:mero_kotha/pages/login_signin.dart';
import 'package:mero_kotha/pages/myRent.dart';
import 'package:mero_kotha/pages/propertyDescription.dart';
import 'package:mero_kotha/pages/propertySelection.dart';
import 'package:mero_kotha/pages/register.dart';
import 'package:mero_kotha/pages/room_search.dart';

import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/login_signup":
        return MaterialPageRoute(builder: (context) => LoginSigninPage());
      case "/register":
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case "/room_search":
        return MaterialPageRoute(
            builder: (context) => RoomSearch(routeSettings.arguments));
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
Color baseColor = Color(0xFFECF0F3);
Color backgroundColor = Color(0xFF193566);
double appBarHeight = 60.0;
const apiKey = "53465FDSFf##%#%%";
const baseUrl = "http://45.76.147.177:8080/";
const imageUrl = "http://45.76.147.177:8080";

// child: Container(
//   decoration: BoxDecoration(
//     border: Border.all(
//       width: 1,
//       color: backgroundColor,
//     ),
//   ),
//   padding: EdgeInsets.all(8.0),
//   width: 300,
//   height: 50,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       Image.asset(
//         "assets/icons/google_logo.png",
//         height: 30,
//         width: 30,
//         fit: BoxFit.fill,
//       ),
//       Text("Continue with google",
//           style: Theme.of(context)
//               .textTheme
//               .bodyText1
//               .copyWith(fontSize: 20))
//     ],
//   ),
// ),
