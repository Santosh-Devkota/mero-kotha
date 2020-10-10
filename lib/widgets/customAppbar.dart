
import 'package:flutter/material.dart';
import 'package:mero_kotha/conf.dart';


class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  MyAppbar({this.preferredSize});
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
                  onTap: () {},
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
