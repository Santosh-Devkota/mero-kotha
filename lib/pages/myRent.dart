import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';
import 'package:mero_kotha/widgets/customDrawer.dart';

import '../conf.dart';

class MyRentPage extends StatefulWidget {
  @override
  _MyRentPageState createState() => _MyRentPageState();
}

class _MyRentPageState extends State<MyRentPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      child: Scaffold(
        drawer: CustomDrawer(),
        key: _key,
        appBar: MyAppbar(
          preferredSize: Size.fromHeight(60.0),
          scaffoldKey: _key,
        ),
        body: SingleChildScrollView(
          child: Text(
            "mY rent page hai yo solti!",
          ),
        ),
      ),
    );
  }
}
