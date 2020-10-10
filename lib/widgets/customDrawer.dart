import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:mero_kotha/widgets/drawerListTile.dart';

import '../conf.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return ClayContainer(
        curveType: CurveType.none,
        // depth: ,
        emboss: true,
        spread: 0,
        width: (MediaQuery.of(context).size.width) * 0.8,
        height: MediaQuery.of(context).size.height,
        color: baseColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: (MediaQuery.of(context).size.width) * 0.8,
              child: Image.asset(
                "assets/icons/drawer_logo.png",
                fit: BoxFit.fill,
                height: 120,
              ),
            ),
            Expanded(child: DrawerListTile()),
          ],
        ));
  }
}
