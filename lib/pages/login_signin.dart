import 'dart:ffi';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:mero_kotha/Bloc/authbloc.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';
import 'package:mero_kotha/widgets/customDrawer.dart';
import 'package:mero_kotha/widgets/illustrativeLogo.dart';
import 'package:mero_kotha/widgets/login_create_button.dart';
import '../Bloc/authbloc.dart';
import '../conf.dart';

class LoginSigninPage extends StatefulWidget {
  @override
  _LoginSigninPageState createState() => _LoginSigninPageState();
}

class _LoginSigninPageState extends State<LoginSigninPage> {
  bool passwordVisible = true;
  // GlobalKey<ScaffoldState> _key = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    double height =
        deviceSize.height - padding.top - padding.bottom - appBarHeight;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      child: Scaffold(
        drawer: CustomDrawer(),
        // key: _key,
        appBar: MyAppbar(
          preferredSize: Size.fromHeight(appBarHeight),
          // scaffoldKey: _key,
          appbarText: "Login",
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              // decoration: new BoxDecoration(
              //   color: baseColor,
              //   image: new DecorationImage(
              //       image: new AssetImage("assets/icons/illustration.png"),
              //       fit: BoxFit.fitWidth,
              //       alignment: Alignment.topCenter),
              // ),
              color: baseColor,
              height: height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IllustrativeLogo(
                    availableHeight: height,
                    availbleWidth: deviceSize.width,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final facebookLogin = FacebookLogin();
                      final result = await facebookLogin.logIn(["email"]);
                      switch (result.status) {
                        case FacebookLoginStatus.loggedIn:
                          BlocProvider.of<AuthBloc>(context)
                              .add(AuthFacebookLogin(result.accessToken.token));
                          break;
                        case FacebookLoginStatus.cancelledByUser:
                          break;
                        case FacebookLoginStatus.error:
                          break;
                      }
                    },
                    child: ClayContainer(
                      width: 300,
                      height: 50,
                      spread: 2,
                      depth: 100,
                      color: baseColor,
                      borderRadius: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/icons/facebook_logo.png",
                              height: 30,
                              width: 30,
                              fit: BoxFit.fill,
                            ),
                            Text("Continue with Facebook",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ClayContainer(
                      width: 300,
                      height: 50,
                      spread: 2,
                      depth: 100,
                      color: baseColor,
                      borderRadius: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/icons/google_logo.png",
                              height: 30,
                              width: 30,
                              fit: BoxFit.fill,
                            ),
                            Text("Continue with Google",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                    height: 15,
                  ),
                  _buildInputField(
                    TextInputType.emailAddress,
                    _emailController,
                    "Enter your Email",
                    "email",
                    false,
                    false,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  _buildInputField(
                    TextInputType.visiblePassword,
                    _passwordController,
                    "Password",
                    "password",
                    true,
                    true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<AuthBloc, AuthStates>(
                      listener: (context, state) {
                    Scaffold.of(context).hideCurrentSnackBar();
                    if (state is AuthTryingState) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Trying.."),
                      ));
                    } else if (state is AuthSuccessState) {
                      
                      Navigator.of(context).pushNamed("/property_selection");
                    } else if (state is AuthFailedState) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                  }, builder: (context, state) {
                    return InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                                AuthLoginEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text));
                          }
                        },
                        child: LoginCreateButton(
                          buttonText: "Login",
                        ));
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/register");
                        },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      TextInputType keyboardInputType,
      TextEditingController _controller,
      String _hinttext,
      String fieldTitle,
      bool showSuffixIcon,
      bool enableObscureText) {
    return Container(
      width: 300.0,
      child: TextFormField(
        controller: _controller,
        validator: (input) {
          switch (fieldTitle) {
            case "name":
              return input.length == 0 ? "Name is required" : null;
              break;
            case "email":
              return input.length == 0 ? "Email is required" : null;
              break;
            case "password":
              if (input.length > 5) {
                return null;
              }
              return "Passord must be atleast 6 characters long";
              break;
            default:
              return null;
          }
        },
        maxLines: 1,
        style: TextStyle(
            height: 1.50,
            color: backgroundColor,
            fontSize: 22.0,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w600),
        cursorColor: backgroundColor.withOpacity(.6),
        keyboardType: keyboardInputType,
        obscureText: enableObscureText == true ? passwordVisible : false,
        decoration: new InputDecoration(
          suffixIcon: showSuffixIcon == true
              ? IconButton(
                  icon: Icon(
// Based on passwordVisible state choose the icon
                    passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
// Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                )
              : null,
          errorBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          errorMaxLines: 2,
          errorStyle: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.red, fontSize: 16),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          fillColor: backgroundColor.withOpacity(0.15),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: BorderSide(color: backgroundColor, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: _hinttext,
          hintStyle: TextStyle(
              color: backgroundColor.withOpacity(.7),
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
