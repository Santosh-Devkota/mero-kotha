import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:mero_kotha/conf.dart';
import 'package:mero_kotha/widgets/neocontainer.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  final scaffoldKey;

  @override
  final Size preferredSize;

  MyAppbar({this.preferredSize, this.scaffoldKey});

  @override
  _MyAppbarState createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: baseColor,
        child: Column(
          children: <Widget>[
            // SizedBox(height: 30,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // ClayContainer(
                //   borderRadius: 5,
                //   color: baseColor,
                //   child: IconButton(
                //     icon: Icon(
                //       Icons.arrow_back,
                //     ),
                //     onPressed: () {},
                //   ),
                //   curveType: CurveType.none,
                //   // depth: 1,

                // ),
                // SizedBox(
                //   width: 5,
                // ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Card(
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.only(left: 10),
                    color: baseColor,
                    elevation: 5,
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(
                        Icons.arrow_back,
                        color: backgroundColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60.0,
                  width: 60.0,
                  child: Image.asset(
                    "assets/images/brandlogo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                InkWell(
                  onTap: () {
                    (widget.scaffoldKey).currentState.openDrawer();
                  },
                  child: Card(
                    margin: EdgeInsets.only(right: 10),
                    elevation: 5,
                    color: baseColor,
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.menu,
                        color: backgroundColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
