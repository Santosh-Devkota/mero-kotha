import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/authbloc.dart';
import 'package:mero_kotha/my_flutter_app_icons.dart';

import '../conf.dart';

class DrawerListTile extends StatelessWidget {
  final drawerCategory = [
    {
      "title": "My Rent",
      "icon": Icon(Icons.person),
    },
    {
      "title": "Home",
      "icon": Icon(Icons.home),
    },
    {"title": "Contact Us", "icon": Icon(Icons.phone_in_talk)},
    //{"title": "Support", "icon": Icon}
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (ctx, state) {
        Scaffold.of(ctx).hideCurrentSnackBar();
        if (state is AuthNotLoggedInState) {
          Navigator.popUntil(ctx, ModalRoute.withName("/"));
          Scaffold.of(ctx).showSnackBar(
            SnackBar(
              content: Text("Logged out successfully"),
              backgroundColor: backgroundColor,
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoggedInState) {
          drawerCategory.add({
            "title": "Logout",
            "icon": Icon(
              MyFlutterApp.logout,
              size: 35,
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
                _drawerAction(context, drawerCategory[index]["title"]);
              },
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
                _drawerAction(context, drawerCategory[index]["title"]);
              },
            ),
          );
        }
      },
    );
  }

  void _drawerAction(BuildContext ctx, String drawerTitle) {
    switch (drawerTitle) {
      case "My Rent":
        Navigator.of(ctx).popAndPushNamed("/myrent");
        break;
      case "Home":
        Navigator.popUntil(ctx, ModalRoute.withName("/"));
        break;
      case "Contact Us":
        Navigator.of(ctx).popAndPushNamed("/contact_us");
        break;
      case "Login":
        Navigator.of(ctx).popAndPushNamed("/login_signup");
        break;
      case "Logout":
        showDialog(
            context: ctx,
            builder: (ctx) => AlertDialog(
                  title: Center(
                      child: Text("Are you sure to logout?",
                          style: Theme.of(ctx)
                              .textTheme
                              .bodyText1
                              .copyWith(fontWeight: FontWeight.w600))),
                  // content: ContactUs(),
                  actions: <Widget>[
                    RaisedButton(
                      clipBehavior: Clip.antiAlias,
                      padding: EdgeInsets.all(0),
                      color: Colors.red,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(ctx).add(AuthLogoutEvent());
                      },
                      child: Text("Yes",
                          style: Theme.of(ctx)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white, fontSize: 20)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RaisedButton(
                      clipBehavior: Clip.antiAlias,
                      padding: EdgeInsets.all(0),
                      color: backgroundColor,
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text(
                        "No",
                        style: Theme.of(ctx)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ));
        break;
      default:
        Navigator.of(ctx).pushNamed("/error");
        break;
    }
  }
}
