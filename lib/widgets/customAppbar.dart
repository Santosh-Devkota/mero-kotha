import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:mero_kotha/conf.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  final scaffoldKey;
  final appbarText;
  final drawerRoute;

  @override
  final Size preferredSize;

  MyAppbar(
      {this.preferredSize,
      this.scaffoldKey,
      this.appbarText,
      this.drawerRoute});

  @override
  _MyAppbarState createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClayContainer(
        depth: 100,
        spread: 0.75,
        color: baseColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                // Navigator.popUntil(context, ModalRoute.withName("/"));
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: ClayContainer(
                  borderRadius: 5,
                  color: baseColor,
                  depth: 200,
                  spread: 2,
                  // height: 35,
                  // width: 35,
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Icon(
                      Icons.arrow_back,
                      color: backgroundColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            widget.appbarText != null
                ? Container(
                    height: 60,
                    child: Center(
                      child: Text(widget.appbarText,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 26)),
                    ),
                  )
                : Container(
                    height: 60.0,
                    width: 60.0,
                    child: Image.asset(
                      "assets/images/brandlogo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
            Builder(
              builder: (ctx) => InkWell(
                onTap: () {
                  Scaffold.of(ctx).openDrawer();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  child: ClayContainer(
                    borderRadius: 5,
                    color: baseColor,
                    depth: 200,
                    spread: 2,
                    // height: 35,
                    // width: 35,
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.menu,
                        color: backgroundColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
