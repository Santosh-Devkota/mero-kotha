import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/authbloc.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';
import 'package:mero_kotha/widgets/customDrawer.dart';
import 'package:mero_kotha/widgets/illustrativeLogo.dart';
import 'package:mero_kotha/widgets/login_create_button.dart';

import '../conf.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = true;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
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
        key: _key,
        appBar: MyAppbar(
          preferredSize: Size.fromHeight(appBarHeight),
          scaffoldKey: _key,
          appbarText: "Register",
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: height,
              width: deviceSize.width,
              color: baseColor,
              child: ClayContainer(
                color: baseColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IllustrativeLogo(
                      availableHeight: height,
                      availbleWidth: deviceSize.width,
                    ),
                    _buildInputField(TextInputType.name, _nameController,
                        "Name", "name", false, false),
                    SizedBox(
                      height: 10.0,
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
                      height: 10.0,
                    ),
                    _buildInputField(
                        TextInputType.visiblePassword,
                        _passwordController,
                        "Password",
                        "password",
                        true,
                        true),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildInputField(TextInputType.phone, _phoneController,
                        "Phone Number", "phone", false, false),
                    SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<AuthBloc, AuthStates>(
                        listener: (context, state) {
                      Scaffold.of(context).hideCurrentSnackBar();
                      if (state is AuthTryingState) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Trying.."),
                        ));
                      } else if (state is AuthRegisterSucessState) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Register complete"),
                          backgroundColor: Colors.green,
                        ));
                      } else if (state is AuthFailedState) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: Colors.redAccent,
                        ));
                      }
                    }, builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                                AuthRegisterEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    name: _nameController.text));
                          }
                        },
                        child: LoginCreateButton(
                          buttonText: "Create",
                        ),
                      );
                    }),
                  ],
                ),
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
