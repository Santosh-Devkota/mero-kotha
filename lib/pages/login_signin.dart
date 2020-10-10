import 'dart:ffi';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:mero_kotha/Bloc/authbloc.dart';
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      child: Scaffold(
<<<<<<< HEAD
        appBar: MyAppbar(preferredSize: Size.fromHeight(60.0)),
        body: SingleChildScrollView(
          child: Form(
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
=======
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
>>>>>>> 3a9c61f68f7c29ee50085887077515767f8b0794
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 300.0,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: _emailController,
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
                      controller: _passwordController,
                      obscureText: true,
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
                  BlocConsumer<AuthBloc,AuthStates>(
                   listener: (context,state){
                     Scaffold.of(context).hideCurrentSnackBar();
                     if(state is AuthTryingState){
                       Scaffold.of(context).showSnackBar(SnackBar(content: Text("Trying.."),));
                     }
                     else if(state is AuthLoggedInState){
                       Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.email),backgroundColor: Colors.green,));
                     }
                     else if(state is AuthFailedState){
                       Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage),backgroundColor: Colors.redAccent,));
                     }
                   },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent(
                                email: _emailController.text,
                                password: _passwordController.text));
                          }
                        },
                        child: ClayContainer(
                          height: 50,
                          width: 300,
                          curveType: CurveType.none,
                          color: baseColor,
                          child: Center(
                            child: Text("Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                          borderRadius: 10.0,
                        ),
                      );
                    }
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
                    onTap: () async {
                      final facebookLogin = FacebookLogin();
                      final result =
                          await facebookLogin.logIn(["email", "name"]);

                      switch (result.status) {
                        case FacebookLoginStatus.loggedIn:
                          break;
                        case FacebookLoginStatus.cancelledByUser:
                          break;
                        case FacebookLoginStatus.error:
                          break;
                      }
                    },
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
      ),
    );
  }
}
