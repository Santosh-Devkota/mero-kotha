import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';
import 'package:mero_kotha/widgets/customDrawer.dart';
import 'package:mero_kotha/widgets/homeCategories.dart';

import '../conf.dart';

class PropertySelectionPage extends StatelessWidget {
  final String nextRoute = "/property_description";
  // final _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      child: Scaffold(
        drawer: CustomDrawer(),
        // key: _key,
        appBar: MyAppbar(
          preferredSize: Size.fromHeight(60.0),
          // scaffoldKey: _key,
        ),
        body: Container(
          width: deviceSize.width,
          height: deviceSize.height,
          color: baseColor,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Property Type",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 30),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Please select the type of property",
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Color(0xFF193566),
                      letterSpacing: 1,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20,
                ),
                HomeCategories(nextRoute)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void pageAction({String departName, String departId, BuildContext ctx}) {
  //   Navigator.pushNamed(ctx, "/property_description", arguments: departName);
  // }
}
