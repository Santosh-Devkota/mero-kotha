import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

import '../conf.dart';

class DrawerListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
