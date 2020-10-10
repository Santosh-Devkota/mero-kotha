import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';
import 'package:mero_kotha/widgets/customDrawer.dart';

import '../conf.dart';

class LoginSigninPage extends StatefulWidget {
  @override
  _LoginSigninPageState createState() => _LoginSigninPageState();
}

class _LoginSigninPageState extends State<LoginSigninPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final _formKey = GlobalKey<FormState>();
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
        body: Form(
          key: _formKey,
          child: Container(
            height: deviceSize.height,
            color: baseColor,
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/illustration.png",
                  width: deviceSize.width,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 300.0,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Enter your Email"),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 300.0,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Password"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: ClayContainer(
                    height: 50,
                    width: 300,
                    curveType: CurveType.none,
                    color: baseColor,
                    child: Center(
                      child: Text("Login",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    borderRadius: 10.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Register",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 3,
                  indent: 70,
                  endIndent: 70,
                ),
                Text(
                  "OR",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: backgroundColor)),
                    padding: EdgeInsets.all(8.0),
                    width: 300,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/facebook_logo.png",
                          height: 30,
                          width: 30,
                          fit: BoxFit.fill,
                        ),
                        Text("Continue with facebook",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 20))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: backgroundColor,
                      ),
                    ),
                    padding: EdgeInsets.all(8.0),
                    width: 300,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/google_logo.png",
                          height: 30,
                          width: 30,
                          fit: BoxFit.fill,
                        ),
                        Text("Continue with google",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 20))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
