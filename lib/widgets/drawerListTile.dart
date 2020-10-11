import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/authbloc.dart';
import 'package:mero_kotha/my_flutter_app_icons.dart';
import 'package:mero_kotha/pages/login_signin.dart';

import '../conf.dart';
//import '../conf.dart';

class DrawerListTile extends StatelessWidget {
  List<Map<String, dynamic>> drawerCategory = [
    {
      "title": "My Rent",
      "icon": Icon(Icons.person),
    },
    {
      "title": "Home",
      "icon": Icon(Icons.home),
    },
    {"title": "Contact Us", "icon": Icon(Icons.phone_in_talk)},
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthStates>(
      builder: (context, state) {
        if (state is AuthLoggedInState) {
          drawerCategory.add({
            "title": "Logout",
            "icon": Icon(
              MyFlutterApp.logout,
              size: 20,
            ),
          });
          return ListView.builder(
            itemCount: drawerCategory.length,
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              title: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: backgroundColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClayContainer(
                      depth: 100,
                      customBorderRadius: BorderRadius.circular(10),
                      color: baseColor,
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: drawerCategory[index]["icon"],
                      ),
                      spread: 1.5,
                      emboss: false,
                      curveType: CurveType.none,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      drawerCategory[index]["title"],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              onTap: () {},
            ),
          );
        } else {
          drawerCategory.add({
            "title": "Login",
            "icon": Icon(
              MyFlutterApp.login_2,
              // size: 20,
            ),
          });
          return ListView.builder(
            itemCount: drawerCategory.length,
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              title: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: backgroundColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClayContainer(
                      depth: 100,
                      customBorderRadius: BorderRadius.circular(10),
                      color: baseColor,
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: drawerCategory[index]["icon"],
                      ),
                      spread: 1.5,
                      emboss: false,
                      curveType: CurveType.none,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      drawerCategory[index]["title"],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              onTap: () {
                switch (drawerCategory[index]["title"]) {
                  case "My Rent":
                    Navigator.of(context).pushNamed("/myrent");
                    break;
                  case "Home":
                    Navigator.popUntil(context, ModalRoute.withName("/"));
                    break;
                  case "Contact Us":
                    Navigator.of(context).pushNamed("/contact_us");
                    break;
                  default:
                    Navigator.of(context).pushNamed("/error");
                    break;
                }
              },
            ),
          );
        }
      },
    );
  }
}
